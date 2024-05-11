import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/core/widgets/snackbars/message_snack_bar.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/launches/screens/widgets/cards/launch_card.dart';
import 'package:galaxyxgate/features/launches/screens/widgets/place_holders/launches_place_holder.dart';
import 'package:galaxyxgate/core/widgets/rows/launches_numbers_row.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: Column(
        children: [
          DefultAppHeader(
            title: AppStrings.launches.tr(context),
            tag: AppStrings.launches.tr(context),
          ),
          Expanded(
            child: BlocConsumer<LaunchesCubit, LaunchesState>(
              listener: (context, state) {
                if (state is GetLaunchesFailuer) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      messageSnackBar(message: state.errorMessage));
                }
              },
              builder: (context, state) {
                if (state is GetLaunchesSuccess) {
                  return RefreshIndicator(
                    onRefresh: () async =>
                        await context.read<LaunchesCubit>().getLaunches(),
                    child: Column(
                      children: [
                        NumbersAndTitlesRow(
                          numbers: [
                            state.launchesModel.length,
                            state.launchesModel
                                .where((element) => element.success ?? false)
                                .length,
                            state.launchesModel
                                .where((element) => element.success != null
                                    ? element.success == false
                                        ? true
                                        : false
                                    : true)
                                .length,
                          ],
                          tiltles: [
                            AppStrings.totalLaunches.tr(context),
                            AppStrings.totalLandings.tr(context),
                            AppStrings.totalFailures.tr(context),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.launchesModel.length,
                            itemBuilder: (context, index) => LaunchCard(
                              launche: state.launchesModel[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const LaunchesPlaceHolder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
