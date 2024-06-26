part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}

final class DeleteAccountLoading extends SignUpState {}

final class DeleteAccountSuccess extends SignUpState {}

final class DeleteAccountFailure extends SignUpState {
  final String message;
  DeleteAccountFailure(this.message);
}
