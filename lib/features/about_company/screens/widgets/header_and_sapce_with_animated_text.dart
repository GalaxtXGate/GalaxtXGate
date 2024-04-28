import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';

class HeaderAndSpaceWithAnimatedText extends StatelessWidget {
  const HeaderAndSpaceWithAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430.h,
      child: Stack(
        children: [
          ShaderMask(
              shaderCallback: (Rect rect) => const LinearGradient(
                    colors: [
                      AppColors.white,
                      AppColors.white,
                      AppColors.white,
                      AppColors.white,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(rect),
              child: Positioned.fill(child: Image.asset(AppImages.space))),
          const DefultAppHeader(
            title: "About SpaceX",
            tag: "About SpaceX",
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Center(
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 5),
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "\"I think we are at the dawn of a new era in commercial space exploration\" - Elon Musk",
                      textStyle: TextStyles.font16White700w,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: SizedBox(
            width: double.infinity,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      AboutCompanyCubit.scrollController.animateTo(
                        AboutCompanyCubit
                            .scrollController.position.maxScrollExtent,
                        duration: const Duration(seconds: 3),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Image.asset(
                      width: 25.w,
                      AppImages.arrows,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
