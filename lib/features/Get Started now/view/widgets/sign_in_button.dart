import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child:ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              AppColors.textGradientColor1,
              AppColors.textGradientColor2,
              AppColors.textGradientColor3], // Gradient colors
            begin: Alignment.topLeft, // Gradient start position
            end: Alignment.topCenter, // Gradient end position
          ).createShader(bounds);
        },
        child: Text("Sign In",style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: "Space Grotesk",
        ),)));
  }
}
