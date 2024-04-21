import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:galaxyxgate/features/home/view/home_screen.dart';
import 'package:galaxyxgate/features/onboarding.dart/view/onboarding_screen.dart';
import '../../features/getStartedNow/screen/getStartedNow_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.getStartNowScreen:
        return MaterialPageRoute(
            builder: (context) => const GetStartNowScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("${settings.name} Not Exiset"),
            ),
          ),
        );
    }
  }
}
