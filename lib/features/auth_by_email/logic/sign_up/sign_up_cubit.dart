import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/features/auth_by_email/data/services/auth_service.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(String email, String password) async {
    emit(SignUpLoading());
    try {
      AuthServices().signUp(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } catch (e) {
      if(e == 'weak-password') {
        emit(SignUpFailure('The password provided is too weak.'));
      } else if (e == 'email-already-in-use') {
        emit(SignUpFailure('The account already exists for that email.'));
      }

      emit(SignUpFailure('An error occurred, please try again.'));
    }
  }
}
