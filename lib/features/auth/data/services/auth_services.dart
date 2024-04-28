import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  saveCredintials(UserCredential credential) {
    AppGeneral.userUID = credential.user!.uid;
    CacheHelper.saveData(
      key: "userUID",
      value: json.encode(credential.user!.uid),
    );
  }

  getCredintials() {
    if (CacheHelper.getData(
          key: "userUID",
        ) !=
        null) {
      String credential = CacheHelper.getData(
        key: "userUID",
      );
      AppGeneral.userUID = json.decode(credential);
    }
  }
}
