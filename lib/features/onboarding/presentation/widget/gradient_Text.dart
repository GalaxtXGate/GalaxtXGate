// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  final Widget child;
  final List<Color> colors;

  const GradientText({
    super.key,
    required this.child,
    required this.colors,
  });

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController.unbounded(
      vsync: this,
    )..repeat(
        reverse: true, min: -0.5, max: 1.5, period: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              transform: TextTransform(animation: _controller.value),
              colors: widget.colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: child,
          );
        },
        child: widget.child);
  }
}

class TextTransform extends GradientTransform {
  final double animation;

  const TextTransform({required this.animation});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * animation, 0, 0);
  }
}
