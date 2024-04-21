import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit() : super(ProfilePictureInitial());
  void pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(ProfilePictureSelected(File(pickedImage.path)));
    }
  }
}
