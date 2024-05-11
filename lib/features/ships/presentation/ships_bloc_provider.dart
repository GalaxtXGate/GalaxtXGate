import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/ships/logic/cubit/ships_cubit.dart';
import 'package:galaxyxgate/features/ships/presentation/ships_screen.dart';

class ShipsBlocProvider extends StatelessWidget {
  const ShipsBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<ShipsCubit>()..getShips(),
        ),
        BlocProvider.value(
          value: getIt<FavoriteCubit>()..getFavorites(),
        ),
      ],
      child: const ShipsScreen(),
    );
  }
}
