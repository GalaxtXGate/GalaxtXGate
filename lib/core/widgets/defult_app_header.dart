import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class DefultAppHeader extends StatelessWidget {
  const DefultAppHeader({
    super.key,
    this.onTap,
    required this.title,
    required this.tag,
  });
  final String title;
  final void Function()? onTap;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60.h,
        right: 30.w,
        left: 30.w,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 25.w,
            ),
            onPressed: () {
              Navigator.pop(context);
              if (onTap != null) {
                onTap!();
              }
            },
          ),
          Hero(
            tag: tag,
            child: Material(
              color: Colors.transparent,
              child: Text(
                title,
                style: TextStyles.font20White700w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
