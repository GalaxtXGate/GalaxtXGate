import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              color: AppColors.deepGrey,
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("or",
                style: TextStyles.font16White700w.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.offWhite2)),
          ),
          Expanded(
            child: Container(
              color: AppColors.deepGrey,
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
