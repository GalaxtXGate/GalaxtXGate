import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class ToggleRow extends StatelessWidget {
  const ToggleRow({
    super.key,
    required this.hintText,
    required this.mainText,
    required this.onPressed,
  });

  final String hintText;
  final String mainText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hintText,
          style: TextStyles.font14White700w.copyWith(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        GradientText(
          colors: const [
            AppColors.purple,
            AppColors.blue,
            AppColors.cyan,
          ],
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              mainText,
              style: TextStyles.font14White700w,
            ),
          ),
        ),
      ],
    );
  }
}
