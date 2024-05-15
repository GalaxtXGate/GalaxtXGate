import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/favourits/data/models/add_fav/add_fav.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';

import '../../../../core/errors/server_failure.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  late FavoriteServices _favoriteServices;
  static List<AddFav> favs = [];
  static ValueNotifier<int> favsCount = ValueNotifier<int>(0);

  FavoriteCubit({required FavoriteServices favoriteServices})
      : super(FavoriteInitial()) {
    _favoriteServices = favoriteServices;
  }

  Future<void> getFavorites() async {
    favs.isEmpty ? emit(GetFavoriteLoading()) : null;
    Either<ServerFailure, List<AddFav>> result =
        await _favoriteServices.getFavorites();
    result.fold(
      (failure) => emit(
        GetFavoriteFailuer(
          errorMessage: failure.errMessage,
        ),
      ),
      (favorites) {
        if (favs != favorites) {
          favs = favorites;
        }
        emit(
          GetFavoriteSuccess(favoriteList: favorites),
        );
      },
    );
  }

  Future<void> addOneFav({
    required BuildContext context,
    required AddFav addFav,
  }) async {
    Either<ServerFailure, void> result =
        await _favoriteServices.addFav(addFav: addFav);
    result.fold(
      (failure) {
        Fluttertoast.showToast(
          msg: failure.errMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.deepGrey,
          textColor: Colors.white,
          fontSize: 16.w,
        );
      },
      (_) {
        Fluttertoast.showToast(
          msg: "Added Successfully".tr(context),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.deepGrey,
          textColor: Colors.white,
          fontSize: 16.w,
        );
      },
    );
  }

  Future<void> removeOneFav({
    required BuildContext context,
    required String id,
  }) async {
    favs.removeWhere((element) => element.id == id);
    favsCount.value = favs.length;

    Either<ServerFailure, void> result =
        await _favoriteServices.removeFav(id: id);
    result.fold(
      (failure) {
        Fluttertoast.showToast(
          msg: failure.errMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.deepGrey,
          textColor: Colors.white,
          fontSize: 16.w,
        );
        emit(DeleteFavFailuer(errorMessage: failure.errMessage));
      },
      (_) {
        Fluttertoast.showToast(
          msg: "Removed Successfully".tr(context),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.deepGrey,
          textColor: Colors.white,
          fontSize: 16.w,
        );
        emit(DeleteFavSuccess());
      },
    );
  }
}
