import 'package:flutter/material.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/favorites_body.dart';

class Favourites extends StatelessWidget {
const Favourites({ Key? key }) : super(key: key);
@override
Widget build(BuildContext context) {
return Scaffold(
  body: FavoritesBody(),
);
}
}