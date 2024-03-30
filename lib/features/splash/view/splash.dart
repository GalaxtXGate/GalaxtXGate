import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/widgets/Starry_Background.dart';
import 'package:galaxyxgate/features/splash/view/widgets/appLogoAndName.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          const StarryBackground(),
          Positioned(
            top: 200.h,
            right: 10.w,
            left: 10.w,
            bottom: 10.h,
            child: const AppLogoAndName(),
          )
        ],
      )),
    );
  }
}
