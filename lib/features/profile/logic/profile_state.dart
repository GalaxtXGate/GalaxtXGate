part of 'profile_cubit.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class GetDataLoading extends ProfileState {}

class GetDataSuccess extends ProfileState {}

class GetDataFailuer extends ProfileState {
  final String message;
  GetDataFailuer(this.message);
}

class UpdateDataLoading extends ProfileState {}

class UpdateDataSuccess extends ProfileState {}

class UpdateDataFailuer extends ProfileState {
  final String message;
  UpdateDataFailuer(this.message);
}

class UpdatePasswordLoading extends ProfileState {}

class UpdatePasswordSuccess extends ProfileState {}

class UpdatePasswordFailuer extends ProfileState {
  final String message;
  UpdatePasswordFailuer(this.message);
}

class UpdateProfilePicLoading extends ProfileState {}

class UpdateProfilePicSuccess extends ProfileState {}

class UpdateProfilePicFailuer extends ProfileState {
  final String message;
  UpdateProfilePicFailuer(this.message);
}
