import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/animated_rockets_listview.dart';
import 'package:galaxyxgate/features/rockets/logic/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets/rockets.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/place_holders/rockets_place_holder.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: const DefultAppHeader(
                title: "Rockets",
                tag: "Rockets",
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  BlocConsumer<RocketsCubit, RocketsState>(
                    listener: (context, state) {
                      // Handle state changes
                      if (state is RocketsError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error!),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      // Render different UI based on state
                      if (state is RocketsLoading) {
                        return const SliverFillRemaining(
                            child: RocketsPlaceHolder());
                      }
                      if (state is RocketsLoaded) {
                        List<Rockets>? rockets = state.rockets;
                        return AnimatedRocketsListView(
                          rockets: rockets!,
                        );
                      }
                      return const SliverFillRemaining(
                          child: Text('No data available'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
