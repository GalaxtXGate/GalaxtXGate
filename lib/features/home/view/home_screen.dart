import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/about_company/screens/about_company_bloc_provider.dart';
import 'package:galaxyxgate/features/home/view/widgets/containers/category_container.dart';
import 'package:galaxyxgate/features/home/view/widgets/rows/home_header_row.dart';
import 'package:galaxyxgate/features/launches/screens/launches_bloc_provider.dart';
import 'package:galaxyxgate/features/rockets/screens/rockets_bloc_provider.dart';

import '../../../core/utils/app_strings.dart';
import '../../crew/screens/crew_bloc_provider.dart';
import '../../ships/presentation/ships_bloc_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GradientGreyBackground(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 50.h,
        ),
        child: ListView(
          controller: scrollController,
          children: [
            // Home Header Row < Profile Pic, Welcome and Name, Notifications Container >
            const HomeHeaderRow(),
            SizedBox(
              height: 10.h,
            ),
            // Explore Our Topics
            Text(
              AppStrings.exploreOurTopics.tr(context),
              style: TextStyles.font16White700w,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    // Ships Category
                    CategoryContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                            page: const ShipsBlocProvider(),
                          ),
                        );
                      },
                      height: 300.h,
                      width: 150.w,
                      backgroundImg: AppImages.spaceShipsCategory,
                      title: AppStrings.spaceShips.tr(context),
                      description: AppStrings
                          .knowAboutActiveShipsTheirDescriptionCompany
                          .tr(context),
                      tag: 'ships',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Rockets Category
                    CategoryContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                            page: const RocketsBlocProvider(),
                          ),
                        );
                      },
                      height: 235.h,
                      width: 150.w,
                      backgroundImg: AppImages.rocketsCategory,
                      title: AppStrings.rockets.tr(context),
                      description: AppStrings
                          .knowAboutActiveRocketsTheirDescriptionCompany
                          .tr(context),
                      tag: 'Rockets',
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
                      title: AppStrings.launches.tr(context),
                      description: AppStrings
                          .knowAboutTheLaunchesNameStateDetails
                          .tr(context),
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                              page: const LauchesBlocProvider()),
                        );
                      },
                      tag: AppStrings.launches.tr(context),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Crew Category
                    CategoryContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(page: const CrewBlocProvider()),
                        );
                      },
                      height: 200.h,
                      width: 150.w,
                      backgroundImg: AppImages.crewCategory,
                      title: AppStrings.crew.tr(context),
                      description: AppStrings
                          .knowAboutTheLaunchesNameStateDetails
                          .tr(context),
                      tag: AppStrings.crew.tr(context),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CategoryContainer(
                      height: 130.h,
                      width: 150.w,
                      backgroundImg: AppImages.aboutSpaceX,
                      title: AppStrings.aboutSpaceX.tr(context),
                      description:
                          AppStrings.knowAllAboutSpaceXDetails.tr(context),
                      onTap: () {
                        Navigator.push(
                          context,
                          LeftSlideTransition(
                              page: const AboutCompanyBlocProvider()),
                        );
                      },
                      tag: AppStrings.aboutSpaceX.tr(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}
