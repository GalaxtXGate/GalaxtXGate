import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';

import 'core/routes/router.dart';

class GalaxyXGateApp extends StatelessWidget {
  const GalaxyXGateApp({
    super.key,
    required this.router,
  });

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'GalaxyXGate',
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.purple,
          scaffoldBackgroundColor: AppColors.lightBlack,
        ),
        initialRoute: AppGeneral.userUID != null
            ? Routes.bottomNavBar
            : Routes.onboarding,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
