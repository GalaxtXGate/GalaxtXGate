import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/features/home_screen/view/home_screen.dart';

class AppRouter {
  MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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
