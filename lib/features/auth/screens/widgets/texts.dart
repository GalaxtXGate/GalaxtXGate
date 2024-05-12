import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

import '../../../../core/utils/app_strings.dart';

class Texts extends StatelessWidget {
  const Texts({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.addYourProfilePicture.tr(context),
            style: TextStyles.textStyle34),
        const SizedBox(
          height: 6,
        ),
        Text(
          AppStrings.youCanChangeYourPictureAtAnytime.tr(context),
          style: TextStyles.textStyle14300,
        ),
      ],
    );
  }
}
