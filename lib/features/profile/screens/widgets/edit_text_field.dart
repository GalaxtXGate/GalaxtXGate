import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

import '../../../../core/utils/app_icons.dart';

class EditTextField extends StatelessWidget {
  const EditTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller});
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: TextStyles.textStyle14400.copyWith(height: 2),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.w),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.lightGrey.withOpacity(0.7),
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
        fillColor: AppColors.deepGrey.withOpacity(0.3),
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyles.textStyle12400,
        labelStyle: TextStyles.textStyle14400.copyWith(color: AppColors.white),
        suffixIcon: Image.asset(AppIcons.edit),
      ),
    );
  }
}
