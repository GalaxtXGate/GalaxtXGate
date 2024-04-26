import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';

class WelcomAndName extends StatelessWidget {
  const WelcomAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack.tr(),
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