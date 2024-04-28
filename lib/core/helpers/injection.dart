

import 'package:get_it/get_it.dart';

import '../../features/profile/logic/profile_cubit.dart';

final getHelper = GetIt.instance;

Future<void> init() async {
// blocs/cubits
  getHelper.registerFactory(() => ProfileCubit());
}