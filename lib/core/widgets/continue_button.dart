import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
          width: screenWidth * 0.86,
          height: screenHeight * 0.089,
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
                width: screenWidth * 0.86,
                height: screenHeight * 0.089,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.continueSign.tr(),
                        style: TextStyles.font16White700w.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                       Icons.arrow_forward_ios_outlined,
                        color: AppColors.white,
                        size: 20,
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
