import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/left_slide_transition.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/helpers/date_time_handler.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/images/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/profile/screens/edit_profile.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/buttons/profile_row_button.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/dialog/delete_account_dialog.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/dialog/log_out_dialog.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';

class ViewProfileData extends StatelessWidget {
  const ViewProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: AppGeneral.user,
        builder:
            (BuildContext context, GalaxyUser? currentUser, Widget? child) =>
                Column(
          children: [
            Hero(
              tag: 'profilePic',
              child: ClipOval(
                child: DefultAppCachedNetworkImage(
                  height: 135.w,
                  width: 135.w,
                  url: currentUser!.profilePic!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              currentUser.name!,
              style: TextStyles.font16White700w.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 28.sp,
              ),
            ),
            Text(
              currentUser.email!,
              style: TextStyles.font14White700w.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            Text(
              AppStrings.memberSince.tr(context) +
                  DateTimeHandler.getLastTime(
                    context: context,
                    time: currentUser.joindate!,
                  ),
              style: TextStyles.font16White700w.copyWith(
                  fontWeight: FontWeight.w300, color: AppColors.darkGrey),
            ),
            SizedBox(
              height: 50.h,
            ),
            ProfileRowButton(
              icon: Icons.edit_note,
              title: 'edit_profile'.tr(context),
              onTap: () {
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
            ProfileRowButton(
              icon: Icons.language_rounded,
              title: 'choose_language'.tr(context),
              isLangs: true,
            ),
            ProfileRowButton(
              icon: Icons.logout_rounded,
              title: AppStrings.logout.tr(context),
              color: AppColors.redOrange,
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => const LogOutDialog());
              },
            ),
            ProfileRowButton(
              icon: Icons.delete_rounded,
              title: AppStrings.deleteAccount.tr(context),
              color: AppColors.redOrange,
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => const DeleteAccountDialog());
              },
            ),
          ],
        ),
      ),
    );
  }
}
