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
    this.isProfile,
    this.isFavourite = false,
    this.numberOfFavorites,
  });
  final String title;
  final void Function()? onTap;
  final String tag;
  final bool? isProfile;
  final bool? isFavourite;
  final String? numberOfFavorites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: (isProfile != null && isProfile!) ? 25.h : 60.h,
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
          ),
          isFavourite!
              ? Padding(
                  padding:  EdgeInsets.only(left: 9.0),
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.red,
                    child: Text(
                      numberOfFavorites!,
                      style: TextStyles.textStyle16400,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
