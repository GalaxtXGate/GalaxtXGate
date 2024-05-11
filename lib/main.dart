import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/router.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/galaxy_x_gate_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  setUpServiceLocator();
  await getIt<AuthServices>().getDataLocal();

  AppGeneral.notFirstTime = CacheHelper.getData(key: 'firstTime') ?? false;

  runApp(
    GalaxyXGateApp(
      router: AppRouter(),
    ),
  );
}
