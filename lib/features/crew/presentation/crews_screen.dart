import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/animated_grid.dart';
import 'package:galaxyxgate/core/widgets/loader.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/sliver_appbar.dart';

class CrewsScreen extends StatefulWidget {
  const CrewsScreen({super.key});
  @override
  State<CrewsScreen> createState() => _CrewsScreenState();
}

class _CrewsScreenState extends State<CrewsScreen> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<CrewsCubit>(context).getCrews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              // AppBar
              CustomSliverAppBar(
                onPressed: () {},
                titleText: 'Crews',
              ),

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
                    return const SliverFillRemaining(child: Loader());
                  }
                  if (state is CrewsLoaded) {
                    List<CrewModel>? crews = state.crews;
                    return AnimatedCrewGrid(
                      crewList: crews,
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
    );
  }
}
