import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

SnackBar messageSnackBar({
  required String message,
  Color? color,
  String? imagePath,
}) {
  return SnackBar(
    elevation: 20,
    backgroundColor: AppColors.deepGrey,
    margin: EdgeInsets.only(
      right: 24.w,
      left: 24.w,
      bottom: 700.h,
    ),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
    duration: Duration(
      seconds: message.length > 50
          //5 seconds for long errMessage
          ? 5
          : message.length < 20
              //3 seconds for short errMessage
              ? 3
              //4 seconds for medium errMessage
              : 4,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.w),
      side: BorderSide(color: AppColors.deepGrey, width: 1.sp),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imagePath != null)
          SvgPicture.asset(
            imagePath,
            height: 24.h,
            width: 29.w,
          ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            message,
            style: TextStyles.font14White700w,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          height: 10.w,
          width: 10.w,
          decoration: BoxDecoration(
            color: color ?? AppColors.deepGrey,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}
