import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/sign_in_button.dart';
import 'package:galaxyxgate/features/getStartedNow/screen/widgets/signup_button.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_divider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.letsKnowMore.tr(),
          style: TextStyles.textStyleGradient,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          AppStrings.getStartedNow.tr(),
          style: TextStyles.textStyle34,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          AppStrings.signInOrCreateAccount.tr(),
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
          title: AppStrings.signUpWithGoogle.tr(),
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
          title: AppStrings.signUpWithFacebook.tr(),
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
          title: AppStrings.signUpWithMail.tr(),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.alreadyHaveAnAccount.tr(),
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
