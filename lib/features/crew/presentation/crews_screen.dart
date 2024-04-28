import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/crew/business_logic/cubit/crews_cubit.dart';
import 'package:galaxyxgate/features/crew/data/models/crew_model.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/crew_grid.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/loader.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CrewsScreen extends StatefulWidget {
  const CrewsScreen({super.key});
  @override
  State<CrewsScreen> createState() => _CrewsScreenState();
}

class _CrewsScreenState extends State<CrewsScreen> {
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
              SliverAppBar(
                backgroundColor: AppColors.lightBlack,
                pinned: true,
                expandedHeight: 50.h,
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                    )),
                title: const Text('Crews'),
                titleTextStyle: TextStyles.font18White700w
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              BlocBuilder<CrewsCubit, CrewsState>(
                builder: (context, state) {
                  // Handle state changes
                  if (state is CrewsError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error!),
                      ),
                    );
                  }
                  // Render different UI based on state
                  if (state is CrewsLoading) {
                    return const SliverFillRemaining(child: Loader());
                  }

                  if (state is CrewsLoaded) {
                    List<CrewModel>? crews = state.crews;
                    return AnimationLimiter(
                      child: CrewsGrid(
                        crewList: crews,
                      ),
                    );
                  }
                  // Default fallback if no known state is matched
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
