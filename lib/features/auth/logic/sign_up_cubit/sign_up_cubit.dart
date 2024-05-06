import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthServices authServices}) : super(SignUpitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController passwordConfirmController =
      TextEditingController();

  static ValueNotifier<File?> profilePic = ValueNotifier<File?>(null);

  Future<void> signUp() async {
    emit(SignUpLoading());
    var result = await _authServices.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    result.fold(
      (failure) => emit(
        SignUpFailure(
          failure.errMessage,
        ),
      ),
      (userCredential) async {
        await uploadUserImage(
          imageFile: profilePic.value!,
          credential: userCredential,
          isSignUp: true,
        );
      },
    );
  }

  Future<void> uploadUserImage({
    required File imageFile,
    required UserCredential credential,
    required bool isSignUp,
  }) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageTaskSnapshot = await uploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    if (isSignUp) {
      GalaxyUser user = GalaxyUser(
        uid: credential.user!.uid,
        email: emailController.text.trim(),
        name: nameController.text,
        profilePic: downloadUrl,
        joindate: DateTime.now().millisecondsSinceEpoch.toString(),
      );
      var result = await _authServices.saveDataToFireBase(user: user);

      result.fold(
        (failure) => emit(
          SignUpFailure(
            failure.errMessage,
          ),
        ),
        (_) async {
          _authServices.saveDataLocal(user: user);

          passwordConfirmController.clear();
          passwordController.clear();
          emailController.clear();
          nameController.clear();
          profilePic.value = null;
          emit(SignUpSuccess());
        },
      );
    } else {
      GalaxyUser user = GalaxyUser(
        profilePic: downloadUrl,
      );

      var result = await _authServices.updateDataToFireBase(user: user);

      result.fold(
        (failure) => emit(
          SignUpFailure(
            failure.errMessage,
          ),
        ),
        (_) async {
          emit(SignUpSuccess());
        },
      );
    }
  }

  void pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profilePic.value = File(pickedImage.path);
    }
    emit(SignUpitial());
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var result = await _authServices.signIn(
      email: AppGeneral.user.value!.email,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(
        DeleteAccountFailure(
          failure.errMessage,
        ),
      ),
      (userCredential) async {
        var result = await _authServices.getDataFromFireBase(
          userId: userCredential.user!.uid,
        );
        result.fold(
          (failure) => emit(
            DeleteAccountFailure(
              failure.errMessage,
            ),
          ),
          (galaxyUser) async {
            await _authServices.updateDataLocal(user: galaxyUser);
            var result = await _authServices.deleteAccount();
            result.fold(
              (failure) => emit(
                DeleteAccountFailure(
                  failure.errMessage,
                ),
              ),
              (_) async {
                passwordController.clear();
                emit(DeleteAccountSuccess());
              },
            );
          },
        );
      },
    );
  }
}
