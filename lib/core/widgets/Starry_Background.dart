// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';

class StarryBackground extends StatelessWidget {
  final int numberOfStars;
  final Color starColor;

  const StarryBackground({
    super.key,
    this.numberOfStars = 200,
    this.starColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StarPainter(numberOfStars: numberOfStars, starColor: starColor),
      child: Container(),
    );
  }
}

class _StarPainter extends CustomPainter {
  _StarPainter({
    required this.numberOfStars,
    required this.starColor,
  });

  final int numberOfStars;
  final Color starColor;

  @override
  void paint(Canvas canvas, Size size) {
    var rng = Random();
    var starPaint = Paint()..color = starColor;

    for (int i = 0; i < numberOfStars; i++) {
      var x = rng.nextDouble() * size.width;
      var y = rng.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 1.0, starPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
