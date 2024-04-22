import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.height,
    required this.width,
    required this.backgroundImg,
    required this.title,
    required this.description,
  });
  final double height;
  final double width;
  final String backgroundImg;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              height: height,
              width: width,
              backgroundImg,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.srcATop,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: () {
              // Navigate to the category screen
            },
            child: SizedBox(
              height: height,
              width: width,
            ),
          ),
        )
      ],
    );
  }
}
