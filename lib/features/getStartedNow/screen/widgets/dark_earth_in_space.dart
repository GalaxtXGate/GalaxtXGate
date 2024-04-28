// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';

class DarkEarthInSpace extends StatelessWidget {
  const DarkEarthInSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.1,
      child: ShaderMask(
        shaderCallback: (Rect rect) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.deepGrey,
            AppColors.deepGrey,
            AppColors.black,
            AppColors.deepBlack,
          ],
        ).createShader(rect),
        child: Image.asset(
          AppImages.darkEarthInSpaceImage,
        ),
      ),
    );
  }
}
