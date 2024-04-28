import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/launches/screens/widgets/columns/number_and_tiltle_column.dart';

class NumbersAndTitlesRow extends StatelessWidget {
  const NumbersAndTitlesRow({
    super.key,
    required this.numbers,
    required this.tiltles,
  });
  final List<int> numbers;
  final List<String> tiltles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 35.h,
        bottom: 30.h,
      ),
      child: IntrinsicHeight(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                numbers.length,
                (index) => Row(
                      children: [
                        NumberAndTiltle(
                          number: numbers[index],
                          title: tiltles[index],
                        ),
                        if (index != numbers.length - 1)
                          VerticalDivider(
                            width: 20.w,
                            color: Colors.grey,
                            thickness: 1.w,
                          ),
                      ],
                    ))),
      ),
    );
  }
}
