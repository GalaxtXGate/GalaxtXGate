import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';

class PositionedSemiCircleWithAnimation extends StatelessWidget {
  const PositionedSemiCircleWithAnimation({
    super.key,
    required this.animation,
    this.right,
    this.left,
    required this.top,
    required this.scale,
    required this.imagePath
  });
  final Animation<double> animation;
  final double? right;
  final double? left;
  final double top;
  final double scale;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: Transform.scale(
        scale: scale,
        child: FadeTransition(
          opacity: animation,
          child: Image.asset(imagePath)
        ),
      ),
    );
  }
}
