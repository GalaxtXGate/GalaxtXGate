import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxyxgate/core/themes/app_images.dart';

class PositionedStarWithAnimation extends StatelessWidget {
  final Animation<double> animation;
  final double right;
  final double bottom;

  const PositionedStarWithAnimation({
    required this.animation,
    required this.right,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      bottom: bottom,
      child: FadeTransition(
        opacity: animation,
        child: SvgPicture.asset(AppImages.star),
      ),
    );
  }
}
