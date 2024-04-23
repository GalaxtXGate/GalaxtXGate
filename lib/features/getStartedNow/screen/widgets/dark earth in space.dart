// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import '../../../../core/themes/app_colors.dart';

class DarkEarthInSpace extends StatelessWidget {
  const DarkEarthInSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              AppColors.deepGrey,
              AppColors.borderGrey,
              AppColors.lightGrey
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(bounds);
        },
        child: Image.asset(AppImages.darkEarthInSpaceImage, fit: BoxFit.cover));
  }
}
