import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/snackbars/message_snack_bar.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_button.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.deepGrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.borderGreyWhite, width: 1.w),
          ),
          child: Text(
            AppStrings.changePassword.tr(context),
            style: TextStyles.font14White700w.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.offWhite,
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            backgroundColor: AppColors.deepGrey,
                            child: SizedBox(
                              height: 200.h,
                              child: Padding(
                                padding: EdgeInsets.all(20.w),
                                child: Column(
                                  children: [
                                    Text(
                                      AppStrings
                                          .areSureYouWantToChangeYourPassword
                                          .tr(context),
                                      style:
                                          TextStyles.font16White700w.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.offWhite,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      AppStrings.youWillReceiveEmailToChangeIt
                                          .tr(context),
                                      style:
                                          TextStyles.font10White700w.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 40.h,
                                          width: 100.w,
                                          child: EditGradientButton(
                                            title: AppStrings.no.tr(context),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        BlocProvider<ProfileCubit>.value(
                                          value: getIt<ProfileCubit>(),
                                          child: BlocConsumer<ProfileCubit,
                                              ProfileState>(
                                            listener: (context, state) {
                                              if (state
                                                  is UpdatePasswordSuccess) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  messageSnackBar(
                                                    message: AppStrings
                                                        .emailSentSuccessfully
                                                        .tr(context),
                                                  ),
                                                );
                                                Navigator.pop(context);
                                              }
                                              if (state
                                                  is UpdatePasswordFailuer) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  messageSnackBar(
                                                    message: state.message,
                                                  ),
                                                );
                                              }
                                            },
                                            builder: (context, state) {
                                              if (state
                                                  is UpdatePasswordLoading) {
                                                return SpinKitWave(
                                                  color: Colors.grey,
                                                  size: 30.w,
                                                );
                                              }
                                              return SizedBox(
                                                height: 40.h,
                                                width: 100.w,
                                                child: EditGradientButton(
                                                  title: AppStrings.yes
                                                      .tr(context),
                                                  onPressed: () async {
                                                    await context
                                                        .read<ProfileCubit>()
                                                        .sendPasswordResetEmail();
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: const SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
