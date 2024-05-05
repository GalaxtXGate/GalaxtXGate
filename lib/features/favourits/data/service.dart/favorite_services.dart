import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteServices {
  List<QueryDocumentSnapshot> data = [];
 Future<List<QueryDocumentSnapshot>> getData()async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('FAV').get();
   return querySnapshot.docs;
  }

  Future<void> removeFav({required String id}) {
    return FirebaseFirestore.instance
        .collection('FAV')
        .doc(id)
        .delete()
        .then((value) => print('Fav Removed $id'))
        .catchError((error) => print('Failed to remove Fav: $error'));
  }
}
