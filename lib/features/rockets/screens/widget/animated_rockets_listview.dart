import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/rocket_details_screen.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/cards/rocket_card.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

class AnimatedRocketsListView extends StatelessWidget {
  final List<RocketsModel> rockets;

  const AnimatedRocketsListView({super.key, required this.rockets});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final rocket = rockets[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 15.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                            page: RocketDetailsScreen(rocket: rocket),
                          ),
                        );
                      },
                      child: RocketCard(
                        rocket: rocket,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: rockets.length,
        ),
      ),
    );
  }
}
