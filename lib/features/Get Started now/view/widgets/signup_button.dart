import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

import '../../../../core/themes/text_styles.dart';

class SignUpButton extends StatelessWidget {
  final String? logoPath;
  final String title;
  const SignUpButton({super.key, required this.logoPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: AppColors.borderGrey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath ?? "",
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const SizedBox();
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyles.textStyleOfWhite16300,
            )
          ],
        ),
      ),
    );
  }
}
