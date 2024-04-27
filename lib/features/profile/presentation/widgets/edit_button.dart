import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_icons.dart';

class EditGradientButton extends StatelessWidget {
  const EditGradientButton({super.key, required this.onPressed,this.suffixIcon,required this.title});
  final VoidCallback onPressed;
  final Widget? suffixIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.loginTextGradientPurple,
            AppColors.loginTextGradientBlue,
            AppColors.loginTextGradientGreen
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: SizedBox(
                height: 60.h,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      suffixIcon??SizedBox(),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: TextStyles.font16White700w.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
