import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/router.dart';
import 'package:galaxyxgate/galaxy_x_gate_app.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/utils/app_assets.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(
      EasyLocalization(
        path: AppAssets.appTranslations,
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('ar'),
        child: const MyApp(),
      )
  );
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
