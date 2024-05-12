import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/toggls/animated_langs_toggle.dart';

class ProfileRowButton extends StatelessWidget {
  const ProfileRowButton({
    super.key,
    required this.icon,
    this.color,
    required this.title,
    this.isLangs,
    this.onTap,
  });
  final IconData icon;
  final Color? color;
  final String title;
  final bool? isLangs;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 25.w,
                  color: color ?? Colors.white,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyles.font14White700w.copyWith(
                    color: color ?? Colors.white,
                  ),
                ),
                const Spacer(),
                (isLangs != null && isLangs!)
                    ? const LangsToggle()
                    : Icon(
                        Icons.arrow_forward_rounded,
                        size: 25.w,
                        color: color ?? Colors.white,
                      ),
              ],
            ),
          ),
          if (isLangs == null || !isLangs!)
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                ),
              ),
            ))
        ],
      ),
    );
  }
}
