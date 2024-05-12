import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_header.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_profile_data.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: GradientGreyBackground(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                DefultAppHeader(
                  title: AppStrings.profile.tr(context),
                  tag: AppStrings.profile.tr(context),
                  isProfile: true,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
                  child: const EditProfileData(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
