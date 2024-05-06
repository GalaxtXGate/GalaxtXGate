import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const ImageIcon(AssetImage(AppIcons.arrowBack)),
          onPressed: () {},
          color: AppColors.white,
          iconSize: 18.sp,
        ),
        Text("Profile",
            style: TextStyles.font20White700w
                .copyWith(fontWeight: FontWeight.w400))
      ],
    );
  }
}
