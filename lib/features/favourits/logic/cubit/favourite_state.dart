part of 'favourite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoriteLoading extends FavoriteState {}

final class GetFavoriteSuccess extends FavoriteState {
  List favoriteList;
  GetFavoriteSuccess({required this.favoriteList});
}

final class DeleteFavSuccess extends FavoriteState {}

final class DeleteFavFailuer extends FavoriteState {
  String errorMessage;
  DeleteFavFailuer({required this.errorMessage});
}

final class GetFavoriteFailuer extends FavoriteState {
  String errorMessage;
  GetFavoriteFailuer({required this.errorMessage});
}
