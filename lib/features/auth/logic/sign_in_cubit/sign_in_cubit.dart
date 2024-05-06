import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthServices authServices}) : super(SignInitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    emit(SignInLoading());
    var result = await _authServices.signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    result.fold(
      (failure) => emit(
        SignInFailure(
          failure.errMessage,
        ),
      ),
      (userCredential) async {
        var result = await _authServices.getDataFromFireBase(
          userId: userCredential.user!.uid,
        );
        result.fold(
          (failure) => emit(
            SignInFailure(
              failure.errMessage,
            ),
          ),
          (galaxyUser) async {
            await _authServices.updateDataLocal(user: galaxyUser);
            emit(
              SignInSuccess(),
            );
          },
        );
      },
    );
  }
}
