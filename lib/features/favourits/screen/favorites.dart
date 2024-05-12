import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/favourits/screen/widgets/favorites_body.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: BlocProvider.value(
        value: getIt<FavoriteCubit>()..getFavorites(),
        child: const FavoritesBody(),
      ),
    );
  }
}
