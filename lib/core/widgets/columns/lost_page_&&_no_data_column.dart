// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';

class LostPageAndNoDataColumn extends StatelessWidget {
  const LostPageAndNoDataColumn({
    super.key,
    required this.mainText,
    required this.subText,
  });
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.pageLost,
            colorBlendMode: BlendMode.srcATop,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            mainText.tr(context),
            style: TextStyles.font16White700w,
          ),
          Text(
            subText.tr(context),
            style: TextStyles.font14White700w.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
