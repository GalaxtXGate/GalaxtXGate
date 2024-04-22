import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_animations.dart';
import 'package:lottie/lottie.dart';

class GradientGrayBackground extends StatelessWidget {
  const GradientGrayBackground({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              AppAnimations.starts,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.black.withOpacity(0.1),
                    AppColors.deepGrey.withOpacity(0.1),
                    AppColors.white.withOpacity(0.2),
                    AppColors.deepGrey.withOpacity(0.1),
                    AppColors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
