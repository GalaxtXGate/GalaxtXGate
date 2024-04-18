import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/onboarding.dart/data/models/content.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/widget/gradient_Text.dart';

class OnBoardingItem extends StatelessWidget {
  final Content content;
  final int currentIndex;

  const OnBoardingItem({
    required this.content,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          content.image,
          height: 400.h,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 80.h),
        Align(
          alignment: Alignment.centerLeft,
          child: GradientText(
            colors: const [AppColors.purple, AppColors.blue, AppColors.cyan],
            child: Text(
              content.text,
              style: TextStyles.textstyle16.copyWith(),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          content.title,
          textAlign: TextAlign.left,
          style: TextStyles.textstyle24.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          content.subTitle,
          textAlign: TextAlign.left,
          style: TextStyles.textstyle16.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
