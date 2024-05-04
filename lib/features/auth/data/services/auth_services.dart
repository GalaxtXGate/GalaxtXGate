import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';

class AuthServices {
  late String email;
  late String password;
  Future<Either<ServerFailure, UserCredential>> signUp(
      {String? password, String? email}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      return right(credential);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return left(
          ServerFailure(errMessage: "The password provided is too weak."),
        );
      } else if (error.code == 'email-already-in-use') {
        return left(
          ServerFailure(
              errMessage: "The account already exists for that email."),
        );
      } else {
        return left(
          ServerFailure(
            errMessage: error.code,
          ),
        );
      }
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, UserCredential>> signIn(
      {String? password, String? email}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return right(credential);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return left(
          ServerFailure(errMessage: "No user found for that email."),
        );
      } else if (error.code == 'wrong-password') {
        return left(
          ServerFailure(errMessage: "Wrong password provided for that user."),
        );
      } else {
        return left(
          ServerFailure(
            errMessage: error.code,
          ),
        );
      }
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, void>> saveDataToFireBase({
    required GalaxyUser user,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('userData');
      await users.doc(user.uid).set(
        {
          'name': user.name,
          'email': user.email,
          'uid': user.uid,
          'profileImageUrl': user.profilePic,
          'joindate': user.joindate,
        },
      );
      return right(null);
    } on FirebaseAuthException catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, void>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (error) {
      return left(ServerFailure(errMessage: error.code));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, GalaxyUser>> updateDataToFireBase({
    required GalaxyUser user,
    File? profilePic,
  }) async {
    try {
      String downloadUrl = "";
      if (profilePic != null) {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference reference = storage.ref().child("${user.uid}_profilePic");
        UploadTask uploadTask = reference.putFile(profilePic);

        TaskSnapshot storageTaskSnapshot = await uploadTask;
        downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      }
      CollectionReference users =
          FirebaseFirestore.instance.collection('userData');
      await users.doc(user.uid).set(
        {
          'uid': AppGeneral.user!.uid,
          'name': (user.name != null && user.name!.isNotEmpty)
              ? user.name
              : AppGeneral.user!.name!,
          'email': (user.email != null && user.email!.isNotEmpty)
              ? user.email
              : AppGeneral.user!.email,
          'profileImageUrl':
              profilePic != null ? downloadUrl : AppGeneral.user!.profilePic,
          'joindate': AppGeneral.user!.joindate,
        },
      );

      // Create a GalaxyUser object from the updated document
      GalaxyUser updatedUser = GalaxyUser(
        uid: user.uid,
        name: (user.name != null && user.name!.isNotEmpty)
            ? user.name
            : AppGeneral.user!.name!,
        email: (user.email != null && user.email!.isNotEmpty)
            ? user.email
            : AppGeneral.user!.email,
        profilePic:
            profilePic != null ? downloadUrl : AppGeneral.user!.profilePic,
        joindate: AppGeneral.user!.joindate,
      );

      await updateDataLocal(user: updatedUser);

      return right(updatedUser);
    } on FirebaseAuthException catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, GalaxyUser>> getDataFromFireBase({
    required String userId,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('userData');
      DocumentSnapshot doc = await users.doc(userId).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        GalaxyUser user = GalaxyUser(
          name: data['name'] as String,
          email: data['email'] as String,
          uid: data['uid'] as String,
          profilePic: data['profileImageUrl'] as String,
          joindate: data['joindate'] as String,
        );
        return right(user);
      } else {
        return left(ServerFailure(errMessage: 'User not found'));
      }
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  saveDataLocal({
    required GalaxyUser user,
  }) {
    AppGeneral.user = user;
    CacheHelper.saveData(key: "userData", value: json.encode(user.toJson()));
  }

  updateDataLocal({
    required GalaxyUser user,
  }) async {
    AppGeneral.user = user;
    CacheHelper.saveData(key: "userData", value: json.encode(user.toJson()));
  }

  getDataLocal() {
    if (CacheHelper.getData(key: "userData") != null) {
      AppGeneral.user = GalaxyUser.fromJson(
          json.decode(CacheHelper.getData(key: "userData")));
    }
  }

  Future<Either<ServerFailure, void>> deleteAccount() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return left(
            ServerFailure(errMessage: 'No user is currently signed in.'));
      }

      // Delete the user's account
      await user.delete();

            CollectionReference users =
          FirebaseFirestore.instance.collection('userData');
     await users.doc(AppGeneral.user!.uid).delete();

      return right(null);
    } on FirebaseAuthException catch (error) {
      return left(ServerFailure(errMessage: error.code));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
