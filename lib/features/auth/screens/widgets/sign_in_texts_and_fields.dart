import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/custom_text_field.dart';

class SignInTextAndFields extends StatelessWidget {
  const SignInTextAndFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.signIn.tr(context), style: TextStyles.textStyle34),
        SizedBox(
          height: 10.h,
        ),
        Text(AppStrings.getBackInToContinueExploring.tr(context),
            style: TextStyles.textStyle14300),
        SizedBox(
          height: 60.h,
        ),
        CustomTextField(
          hintText: AppStrings.enterYourEmail.tr(context),
          labelText: AppStrings.email.tr(context),
          controller: SignInCubit.emailController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          hintText: AppStrings.enterYourPassword.tr(context),
          labelText: AppStrings.password.tr(context),
          isPassword: true,
          controller: SignInCubit.passwordController,
        ),
      ],
    );
  }
}
