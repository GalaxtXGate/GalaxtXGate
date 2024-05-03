import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/custom_text_field.dart';

class SignUpTextAndFields extends StatelessWidget {
  const SignUpTextAndFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign Up', style: TextStyles.textStyle34),
        SizedBox(
          height: 10.h,
        ),
        Text('Create your account to continue exploring',
            style: TextStyles.textStyle14300),
        SizedBox(
          height: 40.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: 'Enter Your Name',
          labelText: 'Name',
          controller: SignUpCubit.nameController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: 'Enter Your Email',
          labelText: 'Email',
          controller: SignUpCubit.emailController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: 'Enter Your Password',
          labelText: 'Password',
          isPassword: true,
          controller: SignUpCubit.passwordController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          height: 60.h,
          hintText: 'Enter Your Password',
          labelText: 'Confirm Password',
          isPassword: true,
          controller: SignUpCubit.passwordConfirmController,
        ),
      ],
    );
  }
}
