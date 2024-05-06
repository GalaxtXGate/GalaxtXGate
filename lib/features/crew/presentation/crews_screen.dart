import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/animated_grid.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/place_holders/crew_place_holder.dart';

import '../../../core/utils/app_strings.dart';

class CrewsScreen extends StatelessWidget {
  const CrewsScreen({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
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
                    title: AppStrings.crew.tr(), tag: AppStrings.crew.tr())),
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
