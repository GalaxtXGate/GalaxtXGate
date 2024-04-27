import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/user_email.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_images.dart';
import '../../logic/profile_cubit.dart';
import 'edit_button.dart';
class ViewProfileData extends StatelessWidget {
  const ViewProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    var _cubit=ProfileCubit.get(context);
    return  Container(
      decoration: BoxDecoration(
          //color: AppColors.darkLight,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderGreyWhite, width: 1.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30.h
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(AppImages.spaceManImage),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Shehab Tarek",
                style: TextStyles.font16White700w.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 28.sp),
              ),
              Text(
                "Member since 2024",
                style: TextStyles.font16White700w.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.darkGrey),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 0.h),
                  child: EditGradientButton(
                    title: "Edit Profile",
                    suffixIcon: Image.asset(AppIcons.edit),
                    onPressed: ()  {
                      _cubit.swapBetweenViewAndEditProfileData(true);
                    },
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                child: UserEmail(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
