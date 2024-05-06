import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/crew/data/repository/crews_repository.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/crew/business_logic/cubit/crews_cubit.dart';
import '../../features/crew/data/services/crews_services.dart';
import '../../features/ships/business_logic/cubit/ships_cubit.dart';
import '../../features/ships/data/repository/ships_repository.dart';
import '../../features/ships/data/services/ships_services.dart';

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

    getIt
    //service
      .registerSingleton<CrewService>(
             CrewServiceImp(dioHelper: getIt()),
      );
    // repository
    getIt.registerSingleton<CrewRepository>(
             CrewRepository(crewService: getIt()),
      );

    //cubit
    getIt.registerSingleton<CrewsCubit>(
             CrewsCubit(crewRepository: getIt()),
      );

    getIt.registerSingleton<ShipsService>(
             ShipsServiceImp(dioHelper: getIt()),
      );

    // repository
    getIt.registerSingleton<ShipsRepository>(
             ShipsRepository(shipsService: getIt()),
      );

    //cubit
    getIt.registerSingleton<ShipsCubit>(
             ShipsCubit(shipsRepository: getIt()),
      );
    getIt.registerSingleton<FavoriteServices>(
      FavoriteServices(),
      );

    // cubit
    getIt.registerSingleton<FavoriteCubit>(
      FavoriteCubit(favoriteServices: getIt()),
      );

    _isServiceLocatorInitialized = true;
  }
}
