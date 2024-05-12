import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';

class DefultAppHeader extends StatelessWidget {
  const DefultAppHeader({
    super.key,
    this.onTap,
    required this.title,
    required this.tag,
    this.isProfile,
    this.isFavourite = false,
    this.canback = true,
  });
  final String title;
  final void Function()? onTap;
  final String tag;
  final bool? isProfile;
  final bool? isFavourite;
  final bool? canback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: (isProfile != null && isProfile!) ? 25.h : 60.h,
        right: 10.w,
        left: 10.w,
      ),
      child: Row(
        children: [
          if (canback != null && canback!)
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
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.redOrange,
                    child: ValueListenableBuilder(
                      valueListenable: FavoriteCubit.favsCount,
                      builder:
                          (BuildContext context, int value, Widget? child) =>
                              Text(
                        value.toString(),
                        style: TextStyles.font16White700w.copyWith(),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
} 
