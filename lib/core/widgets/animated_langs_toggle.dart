import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';

class AnimatedLangsToggle extends StatefulWidget {
  const AnimatedLangsToggle({super.key});

  @override
  State<AnimatedLangsToggle> createState() => _AnimatedLangsToggleState();
}

class _AnimatedLangsToggleState extends State<AnimatedLangsToggle> {
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        backgroundColor: AppColors.darkLight,
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) {
        if (AppGeneral.lang == const Locale("ar")) {
          AppGeneral.lang = const Locale('en');
        } else {
          AppGeneral.lang = const Locale('ar');
        }
        context.setLocale(AppGeneral.lang!);
        setState(() {});
      },
      styleBuilder: (b) => ToggleStyle(
        indicatorColor: b
            ? AppColors.loginTextGradientPurple
            : AppColors.loginTextGradientBlue,
      ),
      iconBuilder: (value) => value
          ? const Icon(
              Icons.language,
              color: AppColors.white,
            )
          : const Icon(
              Icons.language,
              color: AppColors.white,
            ),
      textBuilder: (value) => value
          ? Center(
              child: Text(
              'En',
              style: TextStyles.font12White700w,
            ))
          : Center(
              child: Text(
                'Ar',
                style: TextStyles.font12White700w,
              ),
            ),
    );
  }
}
