import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/rockets/screens/widget/rocket_details_info.dart';
import 'package:galaxyxgate/features/rockets/data/models/rockets_model.dart';

class RocketDetailsScreen extends StatelessWidget {
  final RocketsModel rocket;
  const RocketDetailsScreen({super.key, required this.rocket});
  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const DefultAppHeader(title: "Rockets", tag: "Rockets"),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 30.h),
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
          ],
        ),
      ),
    );
  }
}
