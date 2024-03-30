// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.appIcon,
        ),
        Text(
          "Galaxy X Gate",
          style: TextStyles.textstyle40.copyWith(),
        )
      ],
    );
  }
}
