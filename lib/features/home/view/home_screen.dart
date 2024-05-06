import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/about_company/screens/about_company_bloc_provider.dart';
import 'package:galaxyxgate/features/home/view/widgets/containers/category_container.dart';
import 'package:galaxyxgate/features/home/view/widgets/rows/home_header_row.dart';
import 'package:galaxyxgate/features/launches/screens/launches_bloc_provider.dart';

import '../../../core/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GradientGrayBackground(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 50.h,
        ),
        child: ListView(
          children: [
            // Home Header Row < Profile Pic, Welcome and Name, Notifications Container >
            const Expanded(child: HomeHeaderRow()),
            SizedBox(
              height: 45.h,
            ),
            // Explore Our Topics
            Row(
              children: [
                Text(
                  AppStrings.exploreOurTopics.tr(),
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
                      onTap: () {},
                      height: 300.h,
                      width: 150.w,
                      backgroundImg: AppImages.spaceShipsCategory,
                      title: AppStrings.spaceShips.tr(),
                      description: AppStrings
                          .knowAboutActiveRocketsTheirDescriptionCompany
                          .tr(),
                      onTap: () {},
                      tag: 'Space ships',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Rockets Category
                    CategoryContainer(
                      onTap: () {},
                      height: 235.h,
                      width: 150.w,
                      backgroundImg: AppImages.rocketsCategory,
                      title: AppStrings.rockets.tr(),
                      description: AppStrings
                          .knowAboutActiveRocketsTheirDescriptionCompany
                          .tr(),
                      onTap: () {},
                      tag: 'Rockets',
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    // Launches Category
                    CategoryContainer(
                      onTap: () {},
                      height: 185.h,
                      width: 150.w,
                      backgroundImg: AppImages.launchesCategory,
                      title: AppStrings.launches.tr(),
                      description:
                          AppStrings.knowAboutTheLaunchesNameStateDetails.tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                              page: const LauchesBlocProvider()),
                        );
                      },
                      tag: AppStrings.launches.tr(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Capsules Category
                    CategoryContainer(
                      onTap: () {},
                      height: 164.h,
                      width: 150.w,
                      backgroundImg: AppImages.capsulesCategory,
                      title: AppStrings.capsules.tr(),
                      description: AppStrings
                          .knowAboutActiveCapsulesTheirCountryAndMore
                          .tr(),
                      onTap: () {},
                      tag: AppStrings.capsules.tr(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Crew Category
                    CategoryContainer(
                      onTap: () {},
                      height: 175.h,
                      width: 150.w,
                      backgroundImg: AppImages.crewCategory,
                      title: AppStrings.crew.tr(),
                      description:
                          AppStrings.knowAboutTheLaunchesNameStateDetails.tr(),
                      onTap: () {},
                      tag: AppStrings.crew.tr(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            CategoryContainer(
              height: 110.h,
              width: double.infinity,
              backgroundImg: AppImages.aboutSpaceX,
              title: AppStrings.aboutSpaceX.tr(),
              description:AppStrings.knowAllAboutSpaceXDetails.tr(),
              onTap: () {
                Navigator.push(
                  context,
                  LeftSlideTransition(page: const AboutCompanyBlocProvider()),
                );
              },
              tag: AppStrings.aboutSpaceX.tr(),
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
