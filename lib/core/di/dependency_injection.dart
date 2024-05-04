import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
bool _isServiceLocatorInitialized = false;

void setUpServiceLocator() {
  if (!_isServiceLocatorInitialized) {
    getIt.registerSingleton<DioHelper>(DioHelper());

    getIt.registerSingleton<FlutterSecureStorage>(
      const FlutterSecureStorage(),
    );
    // LaunchesServices
    getIt.registerSingleton<AuthServices>(
      AuthServices(),
    );

    getIt.registerSingleton<SignInCubit>(
      SignInCubit(
        authServices: getIt<AuthServices>(),
      ),
    );
    getIt.registerSingleton<SignUpCubit>(
      SignUpCubit(
        authServices: getIt<AuthServices>(),
      ),
    );

    // LaunchesServices
    getIt.registerSingleton<LaunchesServices>(
      LaunchesServices(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<LaunchesCubit>(
      LaunchesCubit(
        launchesServices: getIt<LaunchesServices>(),
      ),
    );
    // AboutCompanyServices
    getIt.registerSingleton<AboutCompanyServices>(
      AboutCompanyServices(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<AboutCompanyCubit>(
      AboutCompanyCubit(
        aboutCompanyServices: getIt<AboutCompanyServices>(),
      ),
    );

    getIt.registerSingleton<ProfileCubit>(
      ProfileCubit(
        authServices: getIt<AuthServices>(),
      ),
    );

    _isServiceLocatorInitialized = true;
  }
}
