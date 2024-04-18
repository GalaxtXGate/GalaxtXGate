import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/navigation_extention.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/features/onboarding.dart/data/models/content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/widget/animated_page_indicator.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/widget/onboarding_item.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/widget/positioned_star_with_animation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  late AnimationController _animationController;
  late Animation<double> _animation1, _animation2, _animation3;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _animation1 =
        Tween<double>(begin: 0.1, end: 1).animate(_animationController);
    _animation2 =
        Tween<double>(begin: 0.3, end: 1.3).animate(_animationController);
    _animation3 =
        Tween<double>(begin: 0.5, end: 1.5).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // OnBoarding Content
            PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) => OnBoardingItem(
                content: content[index],
                currentIndex: currentIndex,
              ),
            ),
            //Page Indicator
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height * 0.54.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  content.length,
                  (index) => AnimatedPageIndicator(
                    isSelected: currentIndex == index,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
              ),
            ),
            // Star #1
            PositionedStarWithAnimation(
              animation: _animation1,
              bottom: 310.h,
              right: 60.w,
            ),
            // Star #2
            PositionedStarWithAnimation(
              animation: _animation2,
              bottom: 180.h,
              right: 10.w,
            ),
            // Star #3
            PositionedStarWithAnimation(
              animation: _animation3,
              bottom: 100.h,
              right: 320.w,
            ),
          ],
        ),
      ),
      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.white, width: 1),
        ),
        onPressed: () {
          if (currentIndex == content.length - 1) {
            context.navigateToAndReplace(Routes.home);
          }
          _controller!.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        child: SvgPicture.asset(
          AppImages.arrows,
          height: 20.h,
          width: 10.w,
        ),
      ),
    );
  }
}
