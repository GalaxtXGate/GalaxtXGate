import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/bottom_slide_transition.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/buttons/continue_button.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/auth/screens/sign_in.dart';
import 'package:galaxyxgate/features/auth/screens/profile_picture.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/rows/toggle_row.dart';
import 'package:galaxyxgate/features/auth/screens/widgets/sign_up_texts_and_fields.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: GradientGreyBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
              child: ListView(
                children: [
                  // App Logo
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(AppImages.appLogo),
                  ),
                  const SignUpTextAndFields(),
                  SizedBox(
                    height: 75.h,
                  ),
                  CustomGradientButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        LeftSlideTransition(
                          page: const ProfilePicture(),
                        ),
                      );
                    },
                  ),
                  ToggleRow(
                    hintText: AppStrings.alreadyHaveAnAccount.tr(context),
                    mainText: AppStrings.signIn.tr(context),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        BottomSlideTransition(
                          page: const SignIn(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
