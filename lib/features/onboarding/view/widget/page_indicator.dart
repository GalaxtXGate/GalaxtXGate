import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/animated_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int contentLength;
  final Duration animationDuration;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.contentLength,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: MediaQuery.of(context).size.height * 0.54.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          contentLength,
          (index) => AnimatedPageIndicator(
            isSelected: currentIndex == index,
            duration: animationDuration,
          ),
        ),
      ),
    );
  }
}
