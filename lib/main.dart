import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/router.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/galaxy_x_gate_app.dart';
import 'core/utils/app_assets.dart';
import 'package:galaxyxgate/init_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  setUpServiceLocator();
  await getIt<AuthServices>().getDataLocal();

  AppGeneral.notFirstTime = CacheHelper.getData(key: 'firstTime') ?? false;

  runApp(const MyApp());
  CacheHelper.init();
  runApp(EasyLocalization(
    path: AppAssets.appTranslations,
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    fallbackLocale: const Locale('ar'),
    startLocale: const Locale('en'),
    child: const MyApp(),
  ));
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
