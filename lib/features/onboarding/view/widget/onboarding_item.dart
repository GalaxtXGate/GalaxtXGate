import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/onboarding/data/models/content.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/gradient_Text.dart';
import 'package:lottie/lottie.dart';

class OnBoardingItem extends StatelessWidget {
  final Content content;
  final int currentIndex;

  const OnBoardingItem({
    super.key,
    required this.content,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Transform.scale(
          scale: 0.9,
          child: ShaderMask(
              shaderCallback: (Rect rect) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.white,
                        AppColors.white,
                        AppColors.black,
                      ]).createShader(rect),
              child: Lottie.asset(
                fit: BoxFit.cover,
                content.image,
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Align(
                alignment: context.locale==Locale("en")?Alignment.centerLeft:Alignment.centerRight,
                child: GradientText(
                  colors: const [
                    AppColors.purple,
                    AppColors.blue,
                    AppColors.cyan
                  ],
                  child: Text(
                   content.text,
                    style: TextStyles.font16White700w.copyWith(),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                content.title,
                textAlign:context.locale==Locale("en")? TextAlign.left:TextAlign.right,
                style: TextStyles.font34White700w.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                content.subTitle,
                textAlign:context.locale==Locale("en")? TextAlign.left:TextAlign.right,
                style: TextStyles.font16White700w.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
