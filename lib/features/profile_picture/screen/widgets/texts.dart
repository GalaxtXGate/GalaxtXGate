import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class Texts extends StatelessWidget {
  const Texts({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add your profile picture', style: TextStyles.textStyle34),
        const SizedBox(
          height: 6,
        ),
        Text(
          'You can change your picture at anytime',
          style: TextStyles.textStyle14300,
        ),
      ],
    );
  }
}
