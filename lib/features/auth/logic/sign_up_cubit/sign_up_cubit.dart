import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthServices authServices}) : super(SignUpitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

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
        await _authServices.saveCredintials(userCredential);
        await uploadUserImage(
            imageFile: profilePic.value!, credential: userCredential);
        emit(SignUpSuccess());
      },
    );
  }

  Future<void> uploadUserImage(
      {required File imageFile, required UserCredential credential}) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageTaskSnapshot = await uploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    CollectionReference users =
        FirebaseFirestore.instance.collection('usersProfilePics');
    await users.doc(credential.user!.uid).set(
      {
        'profileImageUrl': downloadUrl,
      },
    );
  }

  Future<String> getUserImage(String userUID) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersProfilePics');
    DocumentSnapshot doc = await users.doc(userUID).get();

    if (doc.exists) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return data['profileImageUrl'] as String;
    } else {
      throw Exception('User not found');
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
}
