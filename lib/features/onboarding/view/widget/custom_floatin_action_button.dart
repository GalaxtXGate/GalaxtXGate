import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final PageController? controller;
  final int currentIndex;
  final int contentLength;
  final String route;
  final String svgAssetPath;

  const CustomFloatingActionButton({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.contentLength,
    required this.route,
    required this.svgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white, width: 1),
      ),
      onPressed: () {
        if (currentIndex == contentLength - 1) {
          Navigator.of(context).pushReplacementNamed(route);
        }
        controller?.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: SvgPicture.asset(
        svgAssetPath,
        height: 30.w,
        width: 30.w,
      ),
    );
  }
}
