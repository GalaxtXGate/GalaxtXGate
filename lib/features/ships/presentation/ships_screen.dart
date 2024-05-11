import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/ships/logic/cubit/ships_cubit.dart';
import 'package:galaxyxgate/features/ships/presentation/widget/animated_ships_list.dart';
import 'package:galaxyxgate/features/ships/presentation/widget/place_holders/ships_place_holder.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShipsCubit>(context).getShips();
  }

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: DefultAppHeader(
              title: "ships".tr(context),
              tag: "ships",
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: CustomScrollView(
                slivers: [
                  BlocConsumer<ShipsCubit, ShipsState>(
                    listener: (context, state) {
                      // Handle state changes
                      if (state is ShipsError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error!),
                          ),
                        );
                      }
                    },
                    // Render different UI based on state
                    builder: (context, state) {
                      if (state is ShipsLoading) {
                        return const SliverFillRemaining(
                          child: ShipsPlaceHolder(),
                        );
                      }
                      if (state is ShipsLoaded) {
                        return AnimatedShipsList(
                          ships: state.ships!,
                        );
                      }
                      return const SliverFillRemaining(
                          child: Text('No data available'));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
