import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/router.dart';
import 'package:galaxyxgate/galaxy_x_gate_app.dart';
import 'package:galaxyxgate/core/helpers/injection.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  await di.init();
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
