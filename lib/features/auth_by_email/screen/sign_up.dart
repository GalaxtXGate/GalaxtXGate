import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_in.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/sign_up_texts_and_fields.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return const Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SignUpTextAndFields(),
        ),
      ),
    );
  }
}
