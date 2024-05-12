import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class GradientGreyBackground extends StatelessWidget {
  const GradientGreyBackground({
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
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xff18151A),
                    Color(0xff0F1116),
                  ],
                  stops: [
                    0.0,
                    1.0,
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
