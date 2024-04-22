import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/sign_in_button.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/signup_button.dart';
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
          style: TextStyles.textStyleGradient,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Get Started Now",
          style: TextStyles.textStyle34,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Sign in or create account",
          style: TextStyles.font14White700w.copyWith(
              fontWeight: FontWeight.w300, color: AppColors.lightGrey),
        ),
        const SizedBox(
          height: 20,
        ),
        SignUpButton(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.bottomNavBar,
            );
          },
          logoPath: AppImages.googleLogo,
          title: "Sign Up With Google",
        ),
        SizedBox(
          height: 20.h,
        ),
        SignUpButton(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.bottomNavBar,
            );
          },
          logoPath: AppImages.faceBookLogo,
          title: "Sign Up With Facebook",
        ),
        SizedBox(
          height: 20.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 20.h,
        ),
        SignUpButton(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.bottomNavBar,
            );
          },
          logoPath: null,
          title: "Sign Up With Mail",
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account ?",
              style: TextStyles.font14White700w.copyWith(
                  color: AppColors.offWhite2, fontWeight: FontWeight.w400),
            ),
            const SignInButton()
          ],
        ),
      ],
    );
  }
}
