import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height: 40.w,
        width: 40.w,
        fit: BoxFit.cover,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQSZghHllUVwlprhMv8S2MhZNy8pfFpvrY54sjau9Rb4mrP0Q0J8-czibBNmhi5q1gPk&usqp=CAU",
        placeholder: (context, url) => SpinKitRipple(
          color: Colors.white,
          size: 50.w,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 40.w,
        ),
      ),
    );
  }
}
