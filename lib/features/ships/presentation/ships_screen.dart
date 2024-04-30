import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/loader.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/sliver_appbar.dart';
import 'package:galaxyxgate/features/ships/business_logic/cubit/ships_cubit.dart';
import 'package:galaxyxgate/features/ships/data/models/ships_model.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShipsCubit>(context).getCrews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                onPressed: () {},
                titleText: 'Ships',
              ),
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
                builder: (context, state) {
                  // Render different UI based on state
                  if (state is ShipsLoading) {
                    return const SliverFillRemaining(child: Loader());
                  }
                  if (state is ShipsLoaded) {
                    List<ShipsModel>? ships = state.ships;
                    return AnimationLimiter(
                      child: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, index) {
                            final ship = ships[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 0, 10.w, 15.h),
                                      child: Container(
                                          padding: const EdgeInsets.all(15),
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.deepGrey,
                                              width: 1.r,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 250.w,
                                                child: Text(
                                                  '${ship.homePort}',
                                                  style: TextStyles
                                                      .font12White700w
                                                      .copyWith(
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )),
                            );
                          },
                          childCount: ships!.length,
                        ),
                      ),
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
