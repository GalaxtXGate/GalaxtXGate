import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/data/repository/crews_repository.dart';
import 'package:galaxyxgate/features/crew/data/services/crews_services.dart';
import 'package:galaxyxgate/features/ships/business_logic/cubit/ships_cubit.dart';
import 'package:galaxyxgate/features/ships/data/repository/ships_repository.dart';
import 'package:galaxyxgate/features/ships/data/services/ships_services.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<DioHelper>(() => DioHelper());
  _initCrew();
  _initShips();
}

_initCrew() {
  serviceLocator
    //service
    ..registerFactory<CrewService>(
      () => CrewServiceImp(dioHelper: serviceLocator()),
    )
    // repository
    ..registerFactory<CrewRepository>(
      () => CrewRepository(crewService: serviceLocator()),
    )

    //cubit
    ..registerLazySingleton<CrewsCubit>(
      () => CrewsCubit(crewRepository: serviceLocator()),
    );
}

_initShips() {
  serviceLocator
    //service
    ..registerFactory<ShipsService>(
      () => ShipsServiceImp(dioHelper: serviceLocator()),
    )

    // repository
    ..registerFactory<ShipsRepository>(
      () => ShipsRepository(shipsService: serviceLocator()),
    )

    //cubit
    ..registerLazySingleton<ShipsCubit>(
      () => ShipsCubit(shipsRepository: serviceLocator()),
    );
}
