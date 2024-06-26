import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/Internet_Connection_helper.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_icons.dart';
import 'package:galaxyxgate/core/widgets/columns/lost_page_&&_no_data_column.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/widgets/blured_bottom_nav_bar/blured_bottom_nav_bar.dart';
import 'package:galaxyxgate/features/community_posts/screens/community_posts.dart';
import 'package:galaxyxgate/features/favourits/screen/favorites.dart';
import 'package:galaxyxgate/features/home/view/home_screen.dart';

import '../../profile/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with WidgetsBindingObserver {
  ScrollController scrollController = ScrollController();
  late Timer connectionTimer;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    connectionTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      context.checkInternet();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.hidden) {
      connectionTimer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      while (connectionTimer.isActive) {
        connectionTimer.cancel();
      }
      connectionTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
        context.checkInternet();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    connectionTimer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppGeneral.noConnection,
      builder: (context, value, widget) => BluredBottomNavBar(
        icons: const [
          AppIcons.compassIcon,
          AppIcons.favIcon,
          AppIcons.community,
          AppIcons.personIcon,
        ],
        screens: value
            ? List.generate(
                4,
                (index) => GradientGreyBackground(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const LostPageAndNoDataColumn(
                      mainText: 'No Internet Available',
                      subText:
                          'Please check your internet connection and try again',
                    ),
                  ),
                ),
              )
            : [
                HomeScreen(
                  scrollController: scrollController,
                ),
                Favourites(
                  scrollController: scrollController,
                ),
                CommunityPosts(
                  scrollController: scrollController,
                ),
                const ProfileScreen(),
              ],
        gradientColors: AppColors.maingGradientColor,
        notSelectedColor: AppColors.white,
        scrollController: scrollController,
      ),
    );
  }
}
