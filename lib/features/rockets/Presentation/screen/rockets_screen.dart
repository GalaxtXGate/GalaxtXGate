import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/widgets/loader.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/sliver_appbar.dart';
import 'package:galaxyxgate/features/rockets/Presentation/widget/animated_rockets_listview.dart';
import 'package:galaxyxgate/features/rockets/cubit/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                onPressed: () {},
                titleText: 'Rockets',
              ),
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
                    return const SliverFillRemaining(child: Loader());
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
      ),
    );
  }
}
