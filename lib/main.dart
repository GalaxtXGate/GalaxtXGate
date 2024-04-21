import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/cahch_helper.dart';
import 'package:galaxyxgate/core/routes/router.dart';
import 'package:galaxyxgate/galaxy_x_gate_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CahchHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GalaxyXGateApp(
      router: AppRouter(),
    );
  }
}
