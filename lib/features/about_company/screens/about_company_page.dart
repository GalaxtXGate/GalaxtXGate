import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/core/widgets/launches_numbers_row.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/about_company/screens/widgets/columns/waht_is_spacex_column.dart';
import 'package:galaxyxgate/features/about_company/screens/widgets/header_and_sapce_with_animated_text.dart';
import 'package:galaxyxgate/features/about_company/screens/widgets/rows/elon_mask_info_row.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class AboutCompanyPage extends StatelessWidget {
  const AboutCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<AboutCompanyCubit>().getCompanyInfo();
        },
        child: ListView(
          controller: AboutCompanyCubit.scrollController,
          padding: EdgeInsets.zero,
          children: [
            const HeaderAndSpaceWithAnimatedText(),
            // spacex logo
            Center(
              child: Image.asset(
                width: 250.w,
                AppImages.spaceX,
              ),
            ),
            BlocConsumer<AboutCompanyCubit, AboutCompanyState>(
              listener: (context, state) {
                if (state is GetCompanyInfoFailuer) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      messageSnackBar(message: state.errorMessage));
                }
              },
              builder: (context, state) {
                if (state is GetCompanyInfoSuccess) {
                  return Column(
                    children: [
                      // Employees, Launch Sites, Vehicles
                      NumbersAndTitlesRow(
                        numbers: [
                          state.companyInfo.employees!,
                          state.companyInfo.launchSites!,
                          state.companyInfo.vehicles!,
                        ],
                        tiltles: [
                          AppStrings.employee.tr(context),
                          AppStrings.launchSites.tr(context),
                          AppStrings.vehicles.tr(context),
                        ],
                      ),
                      // Valuation
                      NumbersAndTitlesRow(
                        numbers: [
                          state.companyInfo.valuation!,
                        ],
                        tiltles: [
                          AppStrings.valuation.tr(context),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      const ElonMuskInfoRow(),
                      SizedBox(
                        height: 30.h,
                      ),
                      // middle image
                      Center(
                        child: Image.asset(
                          width: double.infinity,
                          AppImages.spaceXMiddel,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      WhatIsSpaceXColumn(
                        companyInfo: state.companyInfo,
                      ),
                      // footer image
                      SizedBox(
                        height: 30.h,
                      ),
                      // company address
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            colors: const [
                              AppColors.purple,
                              AppColors.blue,
                              AppColors.cyan
                            ],
                            child: Text(
                              AppStrings.address.tr(context),
                              style: TextStyles.font10White700w,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            state.companyInfo.headquarters!.address!,
                            style: TextStyles.font10White700w,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            colors: const [
                              AppColors.purple,
                              AppColors.blue,
                              AppColors.cyan
                            ],
                            child: Text(
                              AppStrings.city.tr(context),
                              style: TextStyles.font10White700w,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            state.companyInfo.headquarters!.city!,
                            style: TextStyles.font10White700w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            ".",
                            style: TextStyles.font20White700w.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GradientText(
                            colors: const [
                              AppColors.purple,
                              AppColors.blue,
                              AppColors.cyan
                            ],
                            child: Text(
                              AppStrings.state.tr(context),
                              style: TextStyles.font10White700w,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            state.companyInfo.headquarters!.state!,
                            style: TextStyles.font10White700w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Image.asset(
                          width: double.infinity,
                          AppImages.spaceXFooter,
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(
                  height: 200.h,
                  child: Center(
                    child: SpinKitPulse(
                      color: Colors.white,
                      size: 50.w,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
