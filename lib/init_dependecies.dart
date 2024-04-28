import 'package:dio/dio.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/data/repository/crews_repository.dart';
import 'package:galaxyxgate/features/crew/data/services/crews_services.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerLazySingleton<DioHelper>(() => DioHelper());
  _initCrew();
}

_initCrew() {
  sl
    //service
    ..registerFactory<CrewService>(
      () => CrewServiceImp(dioHelper: sl()),
    )

    // repository
    ..registerFactory<CrewRepository>(
      () => CrewRepository(crewService: sl()),
    )

    //cubit
    ..registerLazySingleton<CrewsCubit>(
      () => CrewsCubit(crewRepository: sl()),
    );
}
