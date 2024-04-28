// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/utils/app_animations.dart';
import 'package:lottie/lottie.dart';

class AstronautAnimation extends StatelessWidget {
  const AstronautAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.astronaut,
    );
  }
}
