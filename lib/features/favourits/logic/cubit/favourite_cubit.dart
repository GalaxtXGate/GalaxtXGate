import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  FavoriteServices favoriteServices = FavoriteServices();
  List favoriteList = FavoriteServices().data;
  CollectionReference favorite = FirebaseFirestore.instance.collection('FAV');

  Future<void> getFavorite() async {
    emit(GetFavoriteLoading());

    try {
      favoriteList = await favoriteServices.getData();

      emit(GetFavoriteSuccess(favoriteList: favoriteList));
    } catch (e) {
      emit(GetFavoriteFailuer(errorMessage: e.toString()));
    }
  }
}
