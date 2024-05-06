import 'dart:async';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/Internet_Connection_helper.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_icons.dart';
import 'package:galaxyxgate/core/widgets/no_connection_widget.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/blured_bottom_nav_bar.dart';
import 'package:galaxyxgate/features/favourits/screen/favorites.dart';
import 'package:galaxyxgate/features/home/view/home_screen.dart';

import '../../profile/presentation/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late Timer connectionTimer ;
  @override
  void initState() {
    connectionTimer = Timer.periodic(const Duration(seconds: 2), (timer) {context.checkInternet(); });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppGeneral.noConnection,
      builder: (context,value,widget)=> BluredBottomNavBar(
        icons: const [
          AppIcons.compassIcon,
          AppIcons.favIcon,
          AppIcons.personIcon,
        ],
        screens:  [
          if(value)const NoConnectionWidget(),
          if(value)const NoConnectionWidget(),
          if(value)const NoConnectionWidget(),

          if(!value)const HomeScreen(),
          if(!value)const Favourites(),
          if(!value)const ProfileScreen(),
        ],
        gradientColors: AppColors.maingGradientColor,
        notSelectedColor: AppColors.white,
      ),
    );
  }
}
