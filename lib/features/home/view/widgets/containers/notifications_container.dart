import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

class NotificationsContainer extends StatelessWidget {
  const NotificationsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Stack(
          children: [
            Icon(
              Icons.notifications_none,
              color: AppColors.white,
              size: 20.w,
            ),
            Positioned(
              top: 2.h,
              right: 4.w,
              child: Container(
                height: 5.w,
                width: 5.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
