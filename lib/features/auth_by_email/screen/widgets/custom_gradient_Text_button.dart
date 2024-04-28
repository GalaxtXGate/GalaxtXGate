import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/auth_by_email/screen/sign_up.dart';

import '../../../../core/themes/app_colors.dart';
class CustomGradientTextButton extends StatelessWidget {
  const CustomGradientTextButton({super.key, this.onTap, required this.title,});
 final void Function()? onTap;
 final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child:ShaderMask(
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
        child: Text(title,style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: "Space Grotesk",
        ),)));
  }
}
