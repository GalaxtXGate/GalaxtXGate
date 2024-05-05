import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/features/crew/presentation/widget/sliver_appbar.dart';
import 'package:galaxyxgate/features/rockets/Presentation/widget/rocket_details_info.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

class RocketDetailsScreen extends StatelessWidget {
  final RocketsModel rocket;
  const RocketDetailsScreen({super.key, required this.rocket});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                titleText: 'Rocket Details',
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.deepGrey,
                      width: 1.r,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: RocketDetailsInfo(
                    rocket: rocket,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
