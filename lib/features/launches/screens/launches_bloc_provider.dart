import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/launches/screens/launches_page.dart';

class LauchesBlocProvider extends StatelessWidget {
  const LauchesBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider.value(
    value: getIt<LaunchesCubit>()
    ..getLaunches(),
    ),
        BlocProvider.value(
          value: getIt<FavoriteCubit>()
            ..getFavorites(),
        ),
      ],
      child: const LaunchesPage(),
    );
  }
}
