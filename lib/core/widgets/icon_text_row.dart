import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class IconTextRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final TextStyle? textStyle;

  const IconTextRow({
    super.key,
    required this.imagePath,
    required this.text,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              imagePath,
              height: 20.h,
              width: 20.w,
            ),
            const SizedBox(width: 5.0),
            Text(
              text[0].toUpperCase() + text.substring(1),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font12White700w.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
