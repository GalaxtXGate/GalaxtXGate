import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DefultAppCachedNetworkImage extends StatelessWidget {
  const DefultAppCachedNetworkImage({
    super.key,
    required this.height,
    required this.width,
    required this.url,
    this.fit,
  });
  final double height;
  final double width;
  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => SpinKitRipple(
        color: Colors.white,
        size: 50.w,
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 40.w,
      ),
    );
  }
}
