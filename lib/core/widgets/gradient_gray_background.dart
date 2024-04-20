import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withOpacity(0.1),
                    AppColors.white.withOpacity(0.2),
                    AppColors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
