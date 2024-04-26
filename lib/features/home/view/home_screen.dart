import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/home/view/widgets/containers/category_container.dart';
import 'package:galaxyxgate/features/home/view/widgets/rows/home_header_row.dart';

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
            const HomeHeaderRow(),
            SizedBox(
              height: 45.h,
            ),
            // Explore Our Topics
            Row(
              children: [
                Text(
                  "Explore Our Topics",
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
                      title: "Space ships",
                      description:
                          "Know about active rockets, their description, company and more",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Rockets Category
                    CategoryContainer(
                      height: 235.h,
                      width: 150.w,
                      backgroundImg: AppImages.rocketsCategory,
                      title: "Rockets",
                      description:
                          "Know about active rockets, their description, company and more",
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
                      title: "launches",
                      description:
                          "know about the launches name, state, details and more",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Capsules Category
                    CategoryContainer(
                      height: 164.h,
                      width: 150.w,
                      backgroundImg: AppImages.capsulesCategory,
                      title: "Capsules",
                      description:
                          "know about active capsules, their country and more",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Crew Category
                    CategoryContainer(
                      height: 175.h,
                      width: 150.w,
                      backgroundImg: AppImages.crewCategory,
                      title: "Crew",
                      description:
                          "know about the launches name, state, details and more",
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
              title: "About Space X",
              description:
                  "Know all about Space X details",
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
