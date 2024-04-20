import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/Starry_Background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          const StarryBackground(),
          Center(
            child: Text(
              "Home",
              style: TextStyles.font40WhiteBold.copyWith(),
            ),
          )
        ],
      )),
    );
  }
}
