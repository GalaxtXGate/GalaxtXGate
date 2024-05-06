import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';

import '../../../../core/errors/server_failure.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  late FavoriteServices _favoriteServices;
  static List<AddFav> favs = [];

  FavoriteCubit({required FavoriteServices favoriteServices})
      : super(FavoriteInitial()) {
    _favoriteServices = favoriteServices;
  }

  Future<void> getFavorites() async {
    emit(GetFavoriteLoading());
    Either<ServerFailure, List<AddFav>> result =
        await _favoriteServices.getData();
    result.fold(
      (failure) => emit(
        GetFavoriteFailuer(
          errorMessage: failure.errMessage,
        ),
      ),
      (favorites) {
        favs = favorites;
        emit(
          GetFavoriteSuccess(favoriteList: favorites),
        );
      },
    );
  }
}
