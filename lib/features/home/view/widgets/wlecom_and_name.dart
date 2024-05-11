import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
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
          AppStrings.welcomeBack.tr(context),
          style: TextStyles.font14White700w.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          AppGeneral.user.value!.name!,
          style: TextStyles.font20White700w,
        ),
      ],
    );
  }
}
