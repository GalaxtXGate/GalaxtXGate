import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/auth/screens/sign_up.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUp()));
    }, child:ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              AppColors.loginTextGradientPurple,
              AppColors.loginTextGradientBlue,
              AppColors.loginTextGradientGreen], // Gradient colors
            begin: Alignment.topLeft, // Gradient start position
            end: Alignment.topCenter, // Gradient end position
          ).createShader(bounds);
        },
        child: Text(AppStrings.signIn.tr(),style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: "Space Grotesk",
        ),)));
  }
}
