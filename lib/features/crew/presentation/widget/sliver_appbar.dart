import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Function() onPressed;
  final String titleText;

  const CustomSliverAppBar({
    super.key,
    required this.onPressed,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.lightBlack,
      pinned: true,
      expandedHeight: 50.h,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
        ),
      ),
      title: Text(titleText),
      titleTextStyle:
          TextStyles.font18White700w.copyWith(fontWeight: FontWeight.normal),
    );
  }
}
