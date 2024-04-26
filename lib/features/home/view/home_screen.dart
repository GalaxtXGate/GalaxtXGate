import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/home/view/widgets/containers/category_container.dart';
import 'package:galaxyxgate/features/home/view/widgets/rows/home_header_row.dart';

import '../../../core/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientGrayBackground(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 50.h,
        ),
        child: ListView(
          children: [
            // Home Header Row < Profile Pic, Welcome and Name, Notifications Container >
            const HomeHeaderRow(),
            SizedBox(
              height: 45.h,
            ),
            // Explore Our Topics
            Row(
              children: [
                Text(
                  AppStrings. exploreOurTopics.tr(),
                  style: TextStyles.font16White700w,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    // spaceShips Category
                    CategoryContainer(
                      height: 300.h,
                      width: 150.w,
                      backgroundImg: AppImages.spaceShipsCategory,
                      title:  AppStrings.spaceShips.tr(),
                      description:
                          AppStrings.knowAboutActiveRocketsTheirDescriptionCompany.tr(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Rockets Category
                    CategoryContainer(
                      height: 235.h,
                      width: 150.w,
                      backgroundImg: AppImages.rocketsCategory,
                      title:  AppStrings.rockets.tr(),
                      description:
                      AppStrings.knowAboutActiveRocketsTheirDescriptionCompany.tr(),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    // Launches Category
                    CategoryContainer(
                      height: 185.h,
                      width: 150.w,
                      backgroundImg: AppImages.launchesCategory,
                      title: AppStrings.launches.tr(),
                      description:AppStrings.knowAboutTheLaunchesNameStateDetails.tr(),

                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Capsules Category
                    CategoryContainer(
                      height: 164.h,
                      width: 150.w,
                      backgroundImg: AppImages.capsulesCategory,
                      title: AppStrings.capsules.tr(),
                      description: AppStrings.knowAboutActiveCapsulesTheirCountryAndMore.tr(),

                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Crew Category
                    CategoryContainer(
                      height: 175.h,
                      width: 150.w,
                      backgroundImg: AppImages.crewCategory,
                      title:  AppStrings.crew.tr(),
                      description:
                      AppStrings.knowAboutTheLaunchesNameStateDetails.tr(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      )),
    );
  }
}
