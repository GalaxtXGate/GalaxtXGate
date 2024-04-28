import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/features/onboarding/data/models/content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/custom_floatin_action_button.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/page_indicator.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/onboarding_page_view.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/positioned_star_with_animation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  PageController? _controller;
  late AnimationController _animationController;
  late Animation<double> _animatedStar1, _animatedStar2, _animatedStar3;

  @override
  void initState() {
       super.initState();
    initializePageController();
    initializeAnimationController();
    initializeAnimatedStars();
  }

  void initializePageController() {
    _controller = PageController(initialPage: 0);
  }

  void initializeAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  void initializeAnimatedStars() {
    _animatedStar1 =
        Tween<double>(begin: 0.1, end: 1).animate(_animationController);
    _animatedStar2 =
        Tween<double>(begin: 0.3, end: 1.3).animate(_animationController);
    _animatedStar3 =
        Tween<double>(begin: 0.5, end: 1.5).animate(_animationController);
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
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          //page view
          OnBoardingPageView(
            controller: _controller,
            currentIndex: _currentIndex,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          //Page Indicator
          PageIndicator(
            currentIndex: _currentIndex,
            contentLength: content.length,
          ),
          // Star #1
          PositionedStarWithAnimation(
            animation: _animatedStar1,
            bottom: 310.h,
            right:  context.locale==Locale("en")?60.w:0,
            left:   context.locale==Locale("en")?0:60.w,
            scale: 1.5,
          ),
          // Star #2
          PositionedStarWithAnimation(
            animation: _animatedStar2,
            bottom: 180.h,
            right:  context.locale==Locale("en")?10.w:0,
            left:   context.locale==Locale("en")?0:10.w,
            scale: 0.5,
          ),
          // Star #3
          PositionedStarWithAnimation(
            animation: _animatedStar3,
            bottom: 100.h,
            right:  context.locale==Locale("en")?320.w:0,
            left:   context.locale==Locale("en")?0:320.w,
            scale: 1.1,
          ),
        ],
      ),
      // FloatingActionButton
      floatingActionButton: CustomFloatingActionButton(
        controller: _controller,
        currentIndex: _currentIndex,
        contentLength: content.length,
        route: Routes.getStartNowScreen,
        svgAssetPath: AppImages.arrows,
      ),
    );
  }
}
