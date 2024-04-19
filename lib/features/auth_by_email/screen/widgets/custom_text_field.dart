import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.labelText, this.icon});
  final String hintText;
  final String labelText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenHeight * 0.43,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 3,
        ),
        cursorColor: Colors.white,
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
          fillColor: const Color(0xff3d3d3d33),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff686868),
            fontFamily: 'SpaceGrotesk',
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFDF6),
            fontFamily: 'SpaceGrotesk',
          ),
          
        ),
        
      ),
    );
  }
}
