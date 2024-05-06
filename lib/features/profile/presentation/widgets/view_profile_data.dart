import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/date_time_handler.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/profile/presentation/edit_profile.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/buttons/delete_account_button.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/buttons/log_out_button.dart';
import 'package:galaxyxgate/features/profile/presentation/widgets/user_email.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import 'edit_button.dart';

class ViewProfileData extends StatelessWidget {
  const ViewProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: AppColors.darkLight,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderGreyWhite, width: 1.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: 'profilePic',
                child: ClipOval(
                  child: DefultAppCachedNetworkImage(
                    height: 135.w,
                    width: 135.w,
                    url: AppGeneral.user!.profilePic!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppGeneral.user!.name!,
                style: TextStyles.font16White700w
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 28.sp),
              ),
              Text(
                AppStrings.memberSince.tr() +
                    DateTimeHandler.getLastTime(
                      context: context,
                      time: AppGeneral.user!.joindate!,
                    ),
                style: TextStyles.font16White700w.copyWith(
                    fontWeight: FontWeight.w300, color: AppColors.darkGrey),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 0.h),
                child: EditGradientButton(
                  title: "Edit Profile",
                  suffixIcon: Image.asset(AppIcons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      LeftSlideTransition(
                        page: BlocProvider<ProfileCubit>.value(
                          value: getIt<ProfileCubit>(),
                          child: const EditProfile(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                child: const UserEmail(),
              ),
              SizedBox(
                height: 20.h,
              ),
              const LogOutButton(),
              SizedBox(
                height: 20.h,
              ),
              const DeleteAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
