import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class TextStyles {
  static TextStyle textstyle10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: "Space Grotesk",
  );
  static TextStyle textstyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle textstyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle textstyle40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle textStyleGradient = TextStyle(
      fontFamily: "Space Grotesk",
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      foreground: Paint()
        ..shader = LinearGradient(
          colors: <Color>[
            AppColors.loginTextGradientPurple,
            AppColors.loginTextGradientBlue,
            AppColors.loginTextGradientGreen
          ],
        ).createShader(const Rect.fromLTWH(110.0, 70.0, 200.0, 70.0)));
  static TextStyle textStyle34 = TextStyle(
    fontSize: 34.sp,
    fontFamily: "Space Grotesk",
    fontWeight: FontWeight.w300,
    color: AppColors.white,);

  // static TextStyle textStyle14400 = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.offWhite2,
  // );


}
