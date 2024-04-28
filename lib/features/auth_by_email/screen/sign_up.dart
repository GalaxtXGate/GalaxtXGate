import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/logic/sign_up/sign_up_cubit.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/sign_up_texts_and_fields.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child:  Scaffold(
        backgroundColor: AppColors.deepBlack,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SignUpTextAndFields(),
          ),
        ),
      ),
    );
  }
}
