import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/logic/sign_in/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/sign_in_texts_and_fields.dart';
import 'package:galaxyxgate/features/profile_picture/screen/profile_picture.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child:  Scaffold(
        backgroundColor: AppColors.deepBlack,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SignInTextAndFields(),
          ),
        ),
      ),
    );
  }
}
