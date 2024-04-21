part of 'profile_picture_cubit.dart';
abstract class ProfilePictureState {}
class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureSelected extends ProfilePictureState {
  final File selectedImage;

  ProfilePictureSelected(this.selectedImage);
}