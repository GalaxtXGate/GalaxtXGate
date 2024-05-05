import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:galaxyxgate/features/launches/data/services/add_favorite.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  Favorite favoriteServices = Favorite();
  Future<void> addFavorite(
      {required String Title,
      required String Name,
      required String Description,
      required String Image}) async {
    favoriteServices.addFav(
      title: Title,
      name: Name,
      description: Description,
      image: Image,
    );
    emit(AddFavoriteScusess());
  }
  Future<void> removeFavorite({required String id}) async {
    favoriteServices.removeFav(id: id);
    emit(RemoveFavoriteScusess());
  }

}
