import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/widgets/icon_buttons/bottom_nav_bar_icon_button.dart';

class BottomNavBarContainer extends StatefulWidget {
  const BottomNavBarContainer({
    super.key,
    required this.icons,
    required this.gradientColors,
    required this.notSelectedColor,
    required this.pageController,
  });
  final List<String> icons;
  final List<Color> gradientColors;
  final Color notSelectedColor;
  final PageController pageController;

  @override
  State<BottomNavBarContainer> createState() => _BottomNavBarContainerState();
}

class _BottomNavBarContainerState extends State<BottomNavBarContainer> {
  ValueNotifier<int> gradient = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 290.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.deepGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.w),
        color: AppColors.black.withOpacity(0.75),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.w, sigmaY: 5.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: ValueListenableBuilder(
              valueListenable: gradient,
              builder:
                  (BuildContext context, int gradientValue, Widget? child) =>
                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.icons.length,
                  (index) => BottomNavBarIconButton(
                    onPressed: () {
                      gradient.value = index;
                      HapticFeedback.heavyImpact();
                      widget.pageController.jumpToPage(index);
                    },
                    icon: widget.icons[index],
                    isGradient: ValueNotifier(gradientValue == index),
                    notSelectedColor: widget.notSelectedColor,
                    gradientColors: widget.gradientColors,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
