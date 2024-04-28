import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.controller,
    this.isPassword,
  });
  final String hintText;
  final String labelText;
  final IconButton? icon;
  final TextEditingController? controller;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenHeight * 0.43,
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Please Enter Your ${isPassword ?? false? 'Password' : 'Email'}' : null,
        style: TextStyles.textStyle14400.copyWith(height: 2),
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.deepGrey,
              width: 1,
            ),
          ),
          
          focusedBorder: OutlineInputBorder(
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
          hintStyle: TextStyles.textStyle12400,
          suffixIcon: icon,
          labelStyle:
              TextStyles.textStyle14400.copyWith(color: AppColors.white),
        ),
        obscureText: isPassword ?? false,
        controller: controller,
      ),
    );
  }
}
