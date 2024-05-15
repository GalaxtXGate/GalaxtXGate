import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav/add_fav.dart';

import '../../../../core/errors/server_failure.dart';

class FavoriteServices {
  List<QueryDocumentSnapshot> data = [];
  Future<Either<ServerFailure, List<AddFav>>> getFavorites() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('UsersFAV')
          .doc(AppGeneral.user.value!.uid!)
          .collection("FAV")
          .get();

      List<AddFav> favs = querySnapshot.docs
          .map((doc) => AddFav.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return right(favs);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> addFav({required AddFav addFav}) async {
    try {
      await FirebaseFirestore.instance
          .collection('UsersFAV')
          .doc(AppGeneral.user.value!.uid!)
          .collection("FAV")
          .doc(addFav.id)
          .set(addFav.toJson());

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> removeFav({required String id}) async {
    try {
      await FirebaseFirestore.instance
          .collection('UsersFAV')
          .doc(AppGeneral.user.value!.uid!)
          .collection("FAV")
          .doc(id)
          .delete();

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
