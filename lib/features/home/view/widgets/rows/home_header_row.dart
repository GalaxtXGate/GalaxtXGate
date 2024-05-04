import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';
import 'package:galaxyxgate/features/home/view/widgets/wlecom_and_name.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/positioned_star_with_animation.dart';

class HomeHeaderRow extends StatefulWidget {
  const HomeHeaderRow({
    super.key,
  });

  @override
  State<HomeHeaderRow> createState() => _HomeHeaderRowState();
}

class _HomeHeaderRowState extends State<HomeHeaderRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animatedStar1, _animatedStar2;

  @override
  void initState() {
    super.initState();
    initializeAnimationController();
    initializeAnimatedStars();
  }

  initializeAnimatedStars() {
    _animatedStar1 =
        Tween<double>(begin: 0.1, end: 1).animate(_animationController);
    _animatedStar2 =
        Tween<double>(begin: 0.3, end: 1.3).animate(_animationController);
  }

  void initializeAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider<SignUpCubit>.value(
                value: getIt<SignUpCubit>(),
                child: const ProfilePic(),
              ),
              SizedBox(
                width: 10.w,
              ),
              const WelcomAndName(),
            ],
          ),
          PositionedStarWithAnimation(
            animation: _animatedStar1,
            bottom: 30.h,
            right: 10.w,
            scale: 1.2.sp,
            left: 200.w,
          ),
          PositionedStarWithAnimation(
            animation: _animatedStar2,
            bottom: 0.h,
            right: 220.w,
            scale: 0.7,
            left: 40.w,
          ),
        ],
      ),
    );
  }
}
