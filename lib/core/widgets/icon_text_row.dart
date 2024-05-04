import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class IconTextRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final TextStyle? textStyle;

  const IconTextRow({
    super.key,
    required this.imagePath,
    required this.text,
    this.textStyle,
  });

  String capitalizeFirstCharacter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 20.h,
            width: 20.w,
          ),
          const SizedBox(width: 5.0),
          Text(
            capitalizeFirstCharacter(text),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font12White700w.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
