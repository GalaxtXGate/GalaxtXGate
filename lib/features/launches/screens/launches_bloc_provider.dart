import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/launches/logic/favorite/favorites_cubit.dart';
import 'package:galaxyxgate/features/launches/screens/launches_page.dart';

class LauchesBlocProvider extends StatelessWidget {
  const LauchesBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LaunchesCubit(
              launchesServices: LaunchesServices(dioHelper: DioHelper()))
            ..getLaunches(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(),
        )
      ],
      child: const LaunchesPage(),
    );
  }
}
