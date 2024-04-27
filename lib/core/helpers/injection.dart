

import 'package:get_it/get_it.dart';

import '../../features/profile/logic/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! blocs/cubits
  sl.registerFactory(() => ProfileCubit());
//   sl.registerFactory(() => LoginCubit(userRepository: sl()));
//   sl.registerFactory(() => RegisterCubit(userRepository: sl()));
//   sl.registerFactory(() => ProfileCubit(dictionaryRepository: sl()));
//   sl.registerFactory(() =>
//       AddQuestionCubit(dictionaryRepository: sl(), attachmentsService: sl()));
//   sl.registerFactory(() => YoutubeApiCubit(dictionaryRepository: sl()));
//   sl.registerFactory(() => NotificationCubit(dictionaryRepository: sl()));
//
// //! Repositories
//   sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
//     remoteDataSource: sl(),
//     localDataSource: sl(),
//     secureStorage: sl(),
//   ));
//
//   sl.registerLazySingleton<DictionaryRepository>(() => DictionaryRepositoryImpl(
//       remoteDataSource: sl(),
//       localDataSource: sl(),
//       networkInfo: sl()
//   ));
//
// //! Datasources
//   sl.registerLazySingleton<RemoteDataSource>(
//           () => RemoteDataSourceImpl(client: sl()));
//
//   sl.registerLazySingleton<LocalDataSource>(
//           () => LocalDataSourceImpl(localStorageService: sl()));
//
//   sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
//
// //! Core
//   sl.registerLazySingleton(() => DioService());
//   sl.registerLazySingleton(() => LocalStorageService(sl()));
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//   sl.registerLazySingleton(() => AttachmentsService(sl()));
//
// //! External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => InternetConnectionChecker());
//   sl.registerLazySingleton(() => ImagePicker());
//   sl.registerLazySingleton(() => http.Client());
}