import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/widgets/continue_button.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/widgets/sign_in_texts_and_fields.dart';
import 'package:galaxyxgate/features/profile_picture/screen/profile_picture.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:AppColors.deepBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignInTextAndFields(),
              SizedBox(
                height: screenHeight * 0.18,
              ),
              Center(
                child: CustomGradientButton(
                  onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ProfilePicture()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
