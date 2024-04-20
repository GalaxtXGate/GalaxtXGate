// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Galaxy X Gate",
          style: TextStyles.font40WhiteBold,
        )
      ],
    );
  }
}
