import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/auth_by_email/view/widgets/custom_text_field.dart';

class SignInTextAndFields extends StatelessWidget {
  const SignInTextAndFields({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(
            top: screenHeight * 0.05,
            bottom: screenHeight * 0.03,
          ),
          child: Image.asset(AppImages.appLogo),
        ),
        Text('Sign In', style: TextStyles.textStyle34),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text('get back in to continue exploring', style: TextStyles.textStyle14300),
        SizedBox(
          height: screenHeight * 0.1,
        ),
        const CustomTextField(hintText: 'Enter Your Email', labelText: 'Email'),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        const CustomTextField(
            hintText: 'Enter Your Password', labelText: 'Password'),
      ],
    );
  }
}
