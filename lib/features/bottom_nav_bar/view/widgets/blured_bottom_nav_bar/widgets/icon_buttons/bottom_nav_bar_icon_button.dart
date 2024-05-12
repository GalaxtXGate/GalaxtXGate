import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class BottomNavBarIconButton extends StatelessWidget {
  const BottomNavBarIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isGradient,
    required this.notSelectedColor,
    required this.gradientColors,
  });

  final void Function() onPressed;
  final dynamic icon;
  final ValueNotifier<bool> isGradient;
  final List<Color> gradientColors;
  final Color notSelectedColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: ValueListenableBuilder(
        valueListenable: isGradient,
        builder: (context, value, child) => value
            ? GradientText(
                colors: const [
                  AppColors.purple,
                  AppColors.blue,
                  AppColors.cyan
                ],
                child: Image.asset(
                  width: 30.w,
                  height: 30.w,
                  icon.toString(),
                  color: notSelectedColor,
                ),
              )
            : Image.asset(
                width: 30.w,
                height: 30.w,
                icon.toString(),
                color: notSelectedColor,
              ),
      ),
    );
  }
}
