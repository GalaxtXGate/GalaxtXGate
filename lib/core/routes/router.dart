import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/features/auth/screens/sign_in.dart';
import 'package:galaxyxgate/features/auth/screens/sign_up.dart';
import 'package:galaxyxgate/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:galaxyxgate/features/crew/presentation/crews_screen.dart';
import 'package:galaxyxgate/features/home/view/home_screen.dart';
import 'package:galaxyxgate/features/onboarding/presentation/onboarding_screen.dart';
import 'package:galaxyxgate/features/rockets/Presentation/screen/rockets_screen.dart';
import 'package:galaxyxgate/features/ships/presentation/ships_screen.dart';
import 'package:galaxyxgate/features/onboarding/screens/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.crewsScreen:
        return MaterialPageRoute<void>(builder: (_) => const CrewsScreen());
      case Routes.shipsScreen:
        return MaterialPageRoute<void>(builder: (_) => const ShipsScreen());
      case Routes.rocketsScreen:
        return MaterialPageRoute<void>(builder: (_) => const RocketsScreen());
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
