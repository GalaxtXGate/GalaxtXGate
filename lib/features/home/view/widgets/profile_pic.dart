import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: DefultAppCachedNetworkImage(
        height: 40.w,
        width: 40.w,
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQSZghHllUVwlprhMv8S2MhZNy8pfFpvrY54sjau9Rb4mrP0Q0J8-czibBNmhi5q1gPk&usqp=CAU",
      ),
    );
  }
}
