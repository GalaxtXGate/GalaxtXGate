import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/data/services/context_services.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/logic/local_cubit/local_cubit.dart';
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
      child: BlocProvider.value(
        value:  getIt<LocalCubit>()..getSavedLanguage(),
        child: BlocBuilder<LocalCubit, ChangeLocaleState>(
          builder: (context, state) {
            AppGeneral.isArabic.value = BlocProvider.of<LocalCubit>(context)
                    .state
                    .locale
                    .languageCode ==
                "ar";

            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              title: 'GalaxyXGate',
              locale: state.locale,
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.purple,
                scaffoldBackgroundColor: AppColors.lightBlack,
              ),
              initialRoute: AppGeneral.user.value != null &&
                      AppGeneral.user.value!.uid != null
                  ? Routes.bottomNavBar
                  : (AppGeneral.notFirstTime != null &&
                          AppGeneral.notFirstTime!)
                      ? Routes.signIn
                      : Routes.onboarding,
              onGenerateRoute: router.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
