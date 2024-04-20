import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';

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
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'GalaxyXGate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.purple,
          scaffoldBackgroundColor: AppColors.lightBlack,
        ),
        initialRoute: Routes.bottomNavBar,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
