import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/positioned_star_with_animation.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_profile_data.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/semi_circle_with_animation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with SingleTickerProviderStateMixin {
  PageController? _controller;
  late AnimationController _animationController;
  late Animation<double> _animatedStar1,
      _animatedStar2,
      _animatedSemiCircle1,
      _animatedSemiCircle2;
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
    _animatedSemiCircle1 =
        Tween<double>(begin: 0.3, end: 1.3).animate(_animationController);
    _animatedSemiCircle2 =
        Tween<double>(begin: 0.3, end: 1.3).animate(_animationController);
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: GradientGrayBackground(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                DefultAppHeader(
                  title: AppStrings.profile.tr(),
                  tag: AppStrings.profile.tr(),
                  isProfile: true,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
                  child: Stack(
                    children: [
                      PositionedSemiCircleWithAnimation(
                        animation: _animatedSemiCircle1,
                        top: 50.h,
                        right: -10.w,
                        scale: 2,
                        imagePath: AppImages.semicircleImage,
                      ),
                      PositionedSemiCircleWithAnimation(
                        animation: _animatedSemiCircle2,
                        top: 250.h,
                        right: 200,
                        scale: 0.5,
                        imagePath: AppImages.rotatedSemicircleImage,
                      ),
                      const EditProfileData(),
                      PositionedStarWithAnimation(
                        animation: _animatedStar1,
                        bottom: 500.h,
                        right: -80.w,
                        scale: 1.5.sp,
                        left: 100.w,
                      ),
                      PositionedStarWithAnimation(
                        animation: _animatedStar2,
                        bottom: 400.h,
                        right: 220.w,
                        scale: 0.7,
                        left: 40.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
