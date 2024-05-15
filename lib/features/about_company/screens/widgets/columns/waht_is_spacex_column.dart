import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_images.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/about_company/data/models/company_info/company_info.dart';

class WhatIsSpaceXColumn extends StatelessWidget {
  const WhatIsSpaceXColumn({
    super.key,
    required this.companyInfo,
  });
  final CompanyInfo companyInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.whatIsSpaceX.tr(context),
          style: TextStyles.font24White700w,
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.w,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                height: 300.h,
                width: 280.w,
                AppImages.spaceXRocket,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                companyInfo.summary!,
                style: TextStyles.font14White700w.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
