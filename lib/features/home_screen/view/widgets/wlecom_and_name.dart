import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class WelcomAndName extends StatelessWidget {
  const WelcomAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome Back,",
          style: TextStyles.font14White700w.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          "Shehab Tarek !",
          style: TextStyles.font20White700w,
        ),
      ],
    );
  }
}
