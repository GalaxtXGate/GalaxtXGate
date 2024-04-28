import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/routes/routes.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/init_dependecies.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<CrewsCubit>()),
        ],
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          title: 'GalaxyXGate',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.purple,
            scaffoldBackgroundColor: AppColors.lightBlack,
          ),
          initialRoute: Routes.crewsScreen,
          onGenerateRoute: router.generateRoute,
        ),
      ),
    );
  }
}
