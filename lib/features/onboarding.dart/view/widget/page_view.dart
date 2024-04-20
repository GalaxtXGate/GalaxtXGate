import 'package:flutter/material.dart';
import 'package:galaxyxgate/features/onboarding.dart/data/models/content.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/widget/onboarding_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController? controller;
  final int currentIndex;
  final Function(int) onPageChanged;

  const OnBoardingPageView({
    Key? key,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: content.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => OnBoardingItem(
        content: content[index],
        currentIndex: currentIndex,
      ),
    );
  }
}
