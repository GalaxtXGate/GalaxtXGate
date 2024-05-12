import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/crew/logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/screens/widget/animated_grid.dart';
import 'package:galaxyxgate/features/crew/screens/widget/place_holders/crew_place_holder.dart';

import '../../../core/utils/app_strings.dart';

class CrewsScreen extends StatelessWidget {
  const CrewsScreen({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<CrewsCubit>().getCrews();
        },
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                  bottom: 20.h,
                ),
                child: DefultAppHeader(
                    title: AppStrings.crew.tr(context),
                    tag: AppStrings.crew.tr(context))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    // AppBar

                    BlocConsumer<CrewsCubit, CrewsState>(
                      listener: (context, state) {
                        // Handle state changes
                        if (state is CrewsError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error!),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        // Render different UI based on state
                        if (state is CrewsLoading) {
                          return const SliverFillRemaining(
                            child: CrewPlaceHolder(),
                          );
                        }
                        if (state is CrewsLoaded) {
                          return AnimatedCrewGrid(
                            crewList: state.crews,
                          );
                        }
                        // Default fallback if no known state is matched
                        return const SliverFillRemaining(
                          child: Text('No data available'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
