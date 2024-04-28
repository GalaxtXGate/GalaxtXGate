import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:galaxyxgate/features/auth_by_email/data/services/auth_service.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      AuthServices().signIn(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    }on FirebaseAuthException catch(e)  {
      if (e.code == 'user-not-found') {
        emit(SignInFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure('Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailure('An error occurred, please try again.'));
    }
    
  }

}

