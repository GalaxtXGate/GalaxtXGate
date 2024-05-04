import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class NumberAndTiltle extends StatelessWidget {
  const NumberAndTiltle({super.key, required this.number, required this.title});
  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyles.font28White700w,
        ),
        Text(
          title,
          style: TextStyles.font14White700w.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
