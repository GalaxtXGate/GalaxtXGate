import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/animated_rockets_listview.dart';
import 'package:galaxyxgate/features/rockets/cubit/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/place_holders/rockets_place_holder.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> { 
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RocketsCubit>(context).getRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const DefultAppHeader(
              title: "Rockets",
              tag: "Rockets",
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
                        List<RocketsModel>? rockets = state.rockets;
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
