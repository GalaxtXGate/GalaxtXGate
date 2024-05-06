part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure(this.message);
}
