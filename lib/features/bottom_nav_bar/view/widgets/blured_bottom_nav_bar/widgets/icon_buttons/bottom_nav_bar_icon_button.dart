import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarIconButton extends StatelessWidget {
  const BottomNavBarIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isGradient,
    required this.notSelectedColor,
    required this.gradientColors,
  });

  final void Function() onPressed;
  final dynamic icon;
  final ValueNotifier<bool> isGradient;
  final List<Color> gradientColors;
  final Color notSelectedColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: ValueListenableBuilder(
          valueListenable: isGradient,
          builder: (context, value, child) => value
              ? ShaderMask(
                  shaderCallback: (Rect rect) => LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(rect),
                  child: Image.asset(
                    width: 30.w,
                    height: 30.w,
                    icon.toString(),
                    color: notSelectedColor,
                  ),
                )
              : Image.asset(
                  width: 30.w,
                  height: 30.w,
                  icon.toString(),
                  color: notSelectedColor,
                )),
    );
  }
}
