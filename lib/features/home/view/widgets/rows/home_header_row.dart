import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/home/view/widgets/containers/notifications_container.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';
import 'package:galaxyxgate/features/home/view/widgets/wlecom_and_name.dart';

class HomeHeaderRow extends StatelessWidget {
  const HomeHeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfilePic(),
        SizedBox(
          width: 10.w,
        ),
        const WelcomAndName(),
        const Spacer(),
        const NotificationsContainer(),
      ],
    );
  }
}
