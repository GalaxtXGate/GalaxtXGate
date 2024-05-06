import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

import 'gradient_gray_background.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientGrayBackground(
      child: Center(
        child: Text(
          "No Internet Connection",
          style: TextStyles.font18White700w,
        ),
      ),
    ));
  }
}
