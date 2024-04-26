import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/features/onboarding/view/widget/gradient_Text.dart';

class ElonMuskInfoRow extends StatelessWidget {
  const ElonMuskInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Image.asset(
            height: 205.h,
            width: 155.w,
            AppImages.elonMusk,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  colors: const [
                    AppColors.purple,
                    AppColors.blue,
                    AppColors.cyan
                  ],
                  child: Text(
                    "CEO and CTO of SpaceX",
                    style: TextStyles.font10White700w,
                  ),
                ),
                Text(
                  "Elon Musk",
                  style: TextStyles.font18White700w.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Elon Reeve Musk is a businessman and investor. He is the founder, chairman, CEO, and CTO of SpaceX; angel investor, CEO, product architect, and former chairman of Tesla, Inc.; owner, executive chairman, and CTO of X Corp. ",
                  style: TextStyles.font12White700w.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
