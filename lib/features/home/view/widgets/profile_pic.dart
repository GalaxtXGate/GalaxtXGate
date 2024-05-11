import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/widgets/images/defult_app_cached_network_image.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profilePic',
      child: ClipOval(
        child: DefultAppCachedNetworkImage(
          height: 40.w,
          width: 40.w,
          url: AppGeneral.user.value!.profilePic!,
        ),
      ),
    );
  }
}
