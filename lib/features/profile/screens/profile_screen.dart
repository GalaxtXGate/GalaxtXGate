import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/positioned_star_with_animation.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/view_profile_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animatedStar1, _animatedStar2;

  @override
  void initState() {
    super.initState();

    initializeAnimationController();
    initializeAnimatedStars();
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientGreyBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: DefultAppHeader(
                  title: 'profile'.tr(context),
                  tag: 'Profile'.tr(context),
                  canback: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                child: Stack(
                  children: [
                    const ViewProfileData(),
                    PositionedStarWithAnimation(
                      animation: _animatedStar1,
                      bottom: 530.h,
                      right: -80.w,
                      scale: 1.5.sp,
                      left: 100.w,
                    ),
                    PositionedStarWithAnimation(
                      animation: _animatedStar2,
                      bottom: 430.h,
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
    );
  }
}
