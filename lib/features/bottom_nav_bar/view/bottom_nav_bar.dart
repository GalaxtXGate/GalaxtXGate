import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_icons.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/blured_bottom_nav_bar.dart';
import 'package:galaxyxgate/features/home_screen/view/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BluredBottomNavBar(
      icons: const [
        AppIcons.compassIcon,
        AppIcons.favIcon,
        AppIcons.personIcon,
      ],
      screens: [
        Home(),
        Home(),
        Home(),
      ],
      gradientColors: AppColors.maingGradientColor,
      notSelectedColor: AppColors.white,
    );
  }
}