import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
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
        Text(AppStrings.signUp.tr(), style: TextStyles.textStyle34),
        SizedBox(
          height: screenHeight * 0.001,
        ),
        Text(AppStrings.createYourAccountToContinueExploring.tr(),
            style: TextStyles.textStyle14300),
        SizedBox(
          height: screenHeight * 0.04,
        ),
        CustomTextField(hintText: AppStrings.enterYourEmail.tr(), labelText:AppStrings.email.tr()),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        CustomTextField(
            hintText: AppStrings.enterYourPassword.tr(), labelText: AppStrings.password.tr()),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        CustomTextField(
          hintText: AppStrings.enterYourPassword.tr(),
          labelText:AppStrings.confirmPassword.tr(),

        ),
      ],
    );
  }
}
