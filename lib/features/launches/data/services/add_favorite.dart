import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  CollectionReference FAV = FirebaseFirestore.instance.collection('FAV');

  Future<void> addFav({
     String ? title,
     String ? name,
     String ? description,
     String ? image,
  }) {
    return FAV
        .add({
          'title': title,
          'name': name,
          'description': description ?? "No Details",
          'image': image ?? 'No Image',
        })
        .then((value) => print('Fav Added'))
        .catchError((error) => print('Failed to add Fav: $error'));
  }

  Future<void> removeFav({ String? id}) {
    return FirebaseFirestore.instance
        .collection('FAV')
        .doc(id)
        .delete()
        .then((value) => print('Fav Removed $id'))
        .catchError((error) => print('Failed to remove Fav: $error'));
  }
}
