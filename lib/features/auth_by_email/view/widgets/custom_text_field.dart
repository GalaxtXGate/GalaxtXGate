import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField(
      {super.key, required this.hintText, required this.labelText, this.icon,});
  final String hintText;
  final String labelText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenHeight * 0.43,
      child: TextField(
        style: TextStyles.textStyle14400.copyWith(height: 2),
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.deepGrey,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.deepGrey,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: AppColors.black,
          hintText: hintText,
          labelText: labelText,
          hintStyle:  TextStyles.textStyle12400,
          labelStyle:  TextStyles.textStyle14400.copyWith(color:AppColors.white),
        ),
      ),
    );
  }
}
