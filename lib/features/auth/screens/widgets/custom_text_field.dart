import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.isPassword,
    required this.controller,
  });
  final String hintText;
  final String labelText;
  final Icon? icon;
  final bool? isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  ValueNotifier<bool> isSecuerd = ValueNotifier<bool>(false);

  @override
  void initState() {
    if (widget.isPassword != null) {
      isSecuerd.value = widget.isPassword!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSecuerd,
      builder: (BuildContext context, bool value, Widget? child) => SizedBox(
        width: double.infinity,
        height: 85.h,
        child: TextField(
          controller: widget.controller,
          obscureText: value,
          style: TextStyles.textStyle14400.copyWith(height: 2),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword ?? false
                ? IconButton(
                    icon: Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      isSecuerd.value = !isSecuerd.value;
                    },
                  )
                : const SizedBox(),
            contentPadding: EdgeInsets.all(25.w),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.white,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.3),
                width: 1,
              ),
            ),
            filled: true,
            fillColor: AppColors.deepGrey.withOpacity(0.7),
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle: TextStyles.textStyle12400,
            labelStyle:
                TextStyles.textStyle14400.copyWith(color: AppColors.white),
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
