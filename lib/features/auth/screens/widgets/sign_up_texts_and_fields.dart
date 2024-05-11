import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/custom_text_field.dart';

class SignUpTextAndFields extends StatelessWidget {
  const SignUpTextAndFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.signUp.tr(context), style: TextStyles.textStyle34),
        SizedBox(
          height: 10.h,
        ),
        Text(AppStrings.createYourAccountToContinueExploring.tr(context),
            style: TextStyles.textStyle14300),
        SizedBox(
          height: 40.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: AppStrings.enterYourName.tr(context),
          labelText: AppStrings.name.tr(context),
          controller: SignUpCubit.nameController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: AppStrings.enterYourEmail.tr(context),
          labelText: AppStrings.email.tr(context),
          controller: SignUpCubit.emailController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: AppStrings.enterYourPassword.tr(context),
          labelText: AppStrings.password.tr(context),
          isPassword: true,
          controller: SignUpCubit.passwordController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: AppStrings.enterYourPassword.tr(context),
          labelText: AppStrings.confirmPassword.tr(context),
          isPassword: true,
          controller: SignUpCubit.passwordConfirmController,
        ),
      ],
    );
  }
}
