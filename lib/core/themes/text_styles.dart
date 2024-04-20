import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class TextStyles {
  static TextStyle font10White700w = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font12White700w = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font14White700w = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font16White700w = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font18White700w = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font20White700w = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font22White700w = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle font24White700w = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );

  static TextStyle font40WhiteBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: 'SpaceGrotesk',
  );
  static TextStyle textStyleGradient = TextStyle(
      fontFamily: "Space Grotesk",
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      foreground: Paint()
        ..shader = LinearGradient(
          colors: <Color>[
            AppColors.textGradientColor1,
            AppColors.textGradientColor2,
            AppColors.textGradientColor3
          ],
        ).createShader(const Rect.fromLTWH(110.0, 70.0, 200.0, 70.0)));
  static TextStyle textStyle34 = TextStyle(
    fontSize: 34.sp,
    fontFamily: "SpaceGrotesk",
    fontWeight: FontWeight.w300,
    color: AppColors.white,);

  static TextStyle textStyle14300 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.lightGrey,
    fontFamily: "SpaceGrotesk",
  );
   
  static TextStyle textStyleOfWhite16300 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.offWhite,
  );
  static TextStyle textStyle16400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.offWhite2,
  );
  static TextStyle textStyle14400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.offWhite2,
  );
 static TextStyle textStyle12400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.borderGrey,
    fontFamily: "SpaceGrotesk",
  );

}
