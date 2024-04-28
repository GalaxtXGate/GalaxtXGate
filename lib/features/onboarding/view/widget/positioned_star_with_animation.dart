import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';

class PositionedStarWithAnimation extends StatelessWidget {
  const PositionedStarWithAnimation({
    super.key,
    required this.animation,
    required this.right,
    required this.bottom,
    required this.scale,
    required this.left,
  });
  final Animation<double> animation;
  final double right;
  final double left;
  final double bottom;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      bottom: bottom,
      left: left,
      child: Transform.scale(
        scale: scale,
        child: FadeTransition(
          opacity: animation,
          child: SvgPicture.asset(AppImages.star),
        ),
      ),
    );
  }
}
