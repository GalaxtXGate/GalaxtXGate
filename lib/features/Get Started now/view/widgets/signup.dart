import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/Get%20Started%20now/view/widgets/sign_in_button.dart';
import 'package:galaxyxgate/features/Get%20Started%20now/view/widgets/signup_button.dart';
import '../../../../core/themes/app_images.dart';
import '../../../../core/themes/text_styles.dart';
import 'custom_divider.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Let’s Know More",
          style:TextStyles.textStyleGradient,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Get Started Now",
          style:TextStyles.textStyle34,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Sign in or create account",
          style:TextStyles.textStyle14300,
        ),
        const SizedBox(
          height: 20,
        ),
        SignUpButton(logoPath: AppImages.googleLogo,title: "Sign Up With Google",),
        SizedBox(
          height: 20.h,
        ),
        SignUpButton(logoPath: AppImages.faceBookLogo,title: "Sign Up With Facebook",),
        SizedBox(
          height: 20.h,
        ),
        CustomDivider(),
        SizedBox(
          height: 20.h,
        ),
        SignUpButton(logoPath: null,title: "Sign Up With Mail",),
        SizedBox(
          height: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account ?",
              style: TextStyles.textStyle14400 ,
            ),
            SignInButton()
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
         height: 5.h,
          width: 167.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(3.r)
          ),
        )
      ],
    );
  }
}
