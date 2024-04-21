import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/auth_by_email/view/widgets/custom_text_field.dart';

class SignUpTextAndFields extends StatelessWidget {
  const SignUpTextAndFields({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.05,
            bottom: screenHeight * 0.02,
          ),
          child: Image.asset(AppImages.appLogo),
        ),
        Text('Sign Up', style: TextStyles.textStyle34),
        SizedBox(
          height: screenHeight * 0.001,
        ),
        Text('Create your account to continue exploring',
            style: TextStyles.textStyle14300),
        SizedBox(
          height: screenHeight * 0.04,
        ),
        const CustomTextField(hintText: 'Enter Your Email', labelText: 'Email'),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        const CustomTextField(
            hintText: 'Enter Your Password', labelText: 'Password'),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        const CustomTextField(
          hintText: 'Enter Your Password',
          labelText: 'Confirm Password',
        ),
      ],
    );
  }
}
