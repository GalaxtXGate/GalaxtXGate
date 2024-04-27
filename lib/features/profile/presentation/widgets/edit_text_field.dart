import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

import '../../../../core/utils/app_icons.dart';

class EditTextField extends StatelessWidget {
  const EditTextField(
      {super.key, required this.hintText, required this.labelText, this.icon,required this.isSecure});
  final String hintText;
  final String labelText;
  final Widget? icon;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        fillColor: AppColors.textFieldsGrey,
        hintText: hintText,
        labelText: labelText,
        hintStyle:  TextStyles.textStyle12400,
        labelStyle:  TextStyles.textStyle14400.copyWith(color:AppColors.white),
        suffixIcon:   Image.asset(AppIcons.edit),
        prefixIcon: icon,

      ),
      obscureText: isSecure,
    );
  }
}
