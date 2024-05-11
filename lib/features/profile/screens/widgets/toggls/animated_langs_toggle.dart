import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/logic/local_cubit/local_cubit.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';

class LangsToggle extends StatelessWidget {
  const LangsToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'en'.tr(context),
          style: TextStyles.font12White700w,
        ),
        ValueListenableBuilder(
          valueListenable: AppGeneral.isArabic,
          builder: (BuildContext context, bool value, Widget? child) =>
              Transform.scale(
            scale: 0.6,
            child: Switch(
              activeThumbImage: const AssetImage(
                AppImages.toogleCircle,
              ),
              inactiveThumbImage: const AssetImage(
                AppImages.toogleCircle,
              ),
              activeColor: AppColors.blue.withOpacity(0.6),
              inactiveThumbColor: AppColors.blue.withOpacity(0.6),
              activeTrackColor:
                  AppColors.loginTextGradientBlue.withOpacity(0.4),
              inactiveTrackColor:
                  AppColors.loginTextGradientBlue.withOpacity(0.4),
              value: value,
              onChanged: (newValue) {
                context.read<LocalCubit>().changeLanguage(
                    languageCode: AppGeneral.isArabic.value ? 'en' : 'ar');
              },
            ),
          ),
        ),
        Text(
          'ar'.tr(context),
          style: TextStyles.font12White700w,
        ),
      ],
    );
  }
}
