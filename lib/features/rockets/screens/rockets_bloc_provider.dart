import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
 import 'package:galaxyxgate/features/rockets/cubit/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/screens/rockets_screen.dart';

class RocketsBlocProvider extends StatelessWidget {
  const RocketsBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<RocketsCubit>()..getRockets(),
        ),
        BlocProvider.value(
          value: getIt<FavoriteCubit>()..getFavorites(),
        ),
      ],
      child: const RocketsScreen(),
    );
  }
}
