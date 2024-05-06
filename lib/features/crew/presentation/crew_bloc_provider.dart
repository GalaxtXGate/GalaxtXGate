import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/presentation/crews_screen.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';

class CrewBlocProvider extends StatelessWidget {
  const CrewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider.value(
    value: getIt<CrewsCubit>()
    ..getCrews(),
    ),
        BlocProvider.value(
          value: getIt<FavoriteCubit>()
            ..getFavorites(),
        ),
      ],
      child: const CrewsScreen(),
    );
  }
}
