import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:galaxyxgate/core/logic/cubit/localization_cubit.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/rockets/cubit/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/services/rockets_services.dart';
import '../../features/crew/logic/cubit/crews_cubit.dart';
import '../../features/crew/data/services/crews_services.dart';
import '../../features/ships/business_logic/cubit/ships_cubit.dart';
import '../../features/ships/data/repository/ships_repository.dart';
import '../../features/ships/data/services/ships_services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
bool _isServiceLocatorInitialized = false;

void setUpServiceLocator() {
  if (!_isServiceLocatorInitialized) {
    getIt.registerSingleton<DioHelper>(DioHelper());

    getIt.registerSingleton<FlutterSecureStorage>(
      const FlutterSecureStorage(),
    );
    // auth
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

    // Launches
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
    // AboutCompany
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
    // Profile
    getIt.registerSingleton<ProfileCubit>(
      ProfileCubit(
        authServices: getIt<AuthServices>(),
      ),
    );
    // Crew
    getIt.registerSingleton<CrewService>(
      CrewService(dioHelper: getIt()),
    );

    getIt.registerSingleton<CrewsCubit>(
      CrewsCubit(crewService: getIt()),
    );
    // Ships
    getIt.registerSingleton<ShipsService>(
      ShipsServiceImp(dioHelper: getIt()),
    );

    getIt.registerSingleton<ShipsRepository>(
      ShipsRepository(shipsService: getIt()),
    );

    getIt.registerSingleton<ShipsCubit>(
      ShipsCubit(shipsRepository: getIt()),
    );
    // Favs
    getIt.registerSingleton<FavoriteServices>(
      FavoriteServices(),
    );

    getIt.registerSingleton<FavoriteCubit>(
      FavoriteCubit(favoriteServices: getIt()),
    );
    // Rockets
    getIt.registerSingleton<RocketsService>(
      RocketsService(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<RocketsCubit>(
      RocketsCubit(rocketsService: getIt<RocketsService>()),
    );
    // Localization
    getIt.registerSingleton<LocalizationCubit>(
      LocalizationCubit(),
    );

    _isServiceLocatorInitialized = true;
  }
}
