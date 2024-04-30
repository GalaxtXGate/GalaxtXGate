import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class GradientTextColor extends StatelessWidget {
  const GradientTextColor({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            AppColors.loginTextGradientPurple,
            AppColors.loginTextGradientBlue,
            AppColors.loginTextGradientGreen
          ], // Gradient colors
          begin: Alignment.topLeft, // Gradient start position
          end: Alignment.topCenter, // Gradient end position
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyles.textStyle14400.copyWith(fontSize: 12)
      ),
    );
  }
}
