import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class AnimatedPageIndicator extends StatelessWidget {
  final bool isSelected;
  final Duration duration;

  const AnimatedPageIndicator({
    super.key,
    required this.isSelected,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      margin: const EdgeInsets.only(right: 5),
      height: 6.h,
      width: isSelected ? 45.w : 10.w,
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [AppColors.purple, AppColors.blue, AppColors.cyan],
              )
            : const LinearGradient(
                colors: [Colors.grey, Colors.grey],
              ),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
