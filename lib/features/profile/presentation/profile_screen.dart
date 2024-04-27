import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/edit_profile_data.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/semi_circle_with_animation.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/view_profile_data.dart';
import '../../../core/helpers/injection.dart';
import '../../onboarding/view/widget/positioned_star_with_animation.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_states.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  PageController? _controller;
  late AnimationController _animationController;
  late Animation<double> _animatedStar1, _animatedStar2, _animatedSemiCircle1, _animatedSemiCircle2;
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
    _animatedSemiCircle2=
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
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context,state){},
        builder: (context,state)
      {
        var _cubit=ProfileCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.h, 0,20.h),
                    child: CustomAppBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
                    child: Stack(
                      children: [
                        _cubit.isProfileEdit?EditProfileData():ViewProfileData(),
                        _cubit.isProfileEdit?SizedBox():PositionedStarWithAnimation(
                          animation: _animatedStar1,
                          bottom: 420.h,
                          right: 60.w,
                          scale: 1.5,
                        ),
                        _cubit.isProfileEdit?SizedBox():PositionedStarWithAnimation(
                          animation: _animatedStar2,
                          bottom: 330.h,
                          right: 225.w,
                          scale: 0.7,
                        ),
                        PositionedSemiCircleWithAnimation(
                          animation: _animatedSemiCircle1,
                          top:50.h,
                          right:-10.w,
                          scale: _cubit.isProfileEdit?2:1.5,
                          imagePath: AppImages.semicircleImage,
                        ),
                        PositionedSemiCircleWithAnimation(
                          animation: _animatedSemiCircle2,
                          top: _cubit.isProfileEdit?250.h:160.h,
                          right:200,
                          scale: _cubit.isProfileEdit?0.5:1,
                          imagePath: AppImages.rotatedSemicircleImage,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}
