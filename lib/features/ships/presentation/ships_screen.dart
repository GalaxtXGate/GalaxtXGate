import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/features/ships/business_logic/cubit/ships_cubit.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const DefultAppHeader(title: "ships", tag: "ships")),
            Expanded(
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
                        List<ShipsModel>? ships = state.ships;
                        return AnimatedShipsList(
                          ships: ships!,
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
