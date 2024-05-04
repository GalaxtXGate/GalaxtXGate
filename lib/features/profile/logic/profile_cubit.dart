import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required AuthServices authServices})
      : super(InitialProfileState()) {
    _authServices = authServices;
  }
  late AuthServices _authServices;

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static ValueNotifier<File?> profilePic = ValueNotifier<File?>(null);

  Future<void> getUserData() async {
    emit(GetDataLoading());
    var result = await _authServices.getDataFromFireBase(
      userId: AppGeneral.user.value!.uid!,
    );
    result.fold(
      (failure) => emit(
        GetDataFailuer(
          failure.errMessage,
        ),
      ),
      (userCredential) async {
        emit(GetDataSuccess());
      },
    );
  }

  Future<void> updateUserData() async {
    emit(UpdateDataLoading());

    Either<ServerFailure, void> result =
        await _authServices.updateDataToFireBase(
      user: GalaxyUser(
        uid: AppGeneral.user.value!.uid!,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
      ),
    );
    result.fold(
      (failure) => emit(
        UpdateDataFailuer(
          failure.errMessage,
        ),
      ),
      (_) async {
        emit(UpdateDataSuccess());
      },
    );
  }

  Future<void> sendPasswordResetEmail() async {
    emit(UpdatePasswordLoading());

    Either<ServerFailure, void> result =
        await _authServices.sendPasswordResetEmail(
      email: AppGeneral.user.value!.email!,
    );
    result.fold(
      (failure) => emit(
        UpdatePasswordFailuer(
          failure.errMessage,
        ),
      ),
      (_) async {
        emit(UpdatePasswordSuccess());
      },
    );
  }

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(UpdateProfilePicLoading());

      Either<ServerFailure, GalaxyUser> result =
          await _authServices.updateDataToFireBase(
        user: GalaxyUser(),
        profilePic: File(pickedImage.path),
      );
      result.fold(
        (error) {
          emit(
            UpdateProfilePicFailuer(error.errMessage),
          );
        },
        (user) {
          emit(
            UpdateProfilePicSuccess(),
          );
        },
      );
    }
  }
}
