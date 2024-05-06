import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/buttons/change_password_button.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import 'edit_button.dart';
import 'edit_text_field.dart';

class EditProfileData extends StatefulWidget {
  const EditProfileData({super.key});

  @override
  State<EditProfileData> createState() => _EditProfileDataState();
}

class _EditProfileDataState extends State<EditProfileData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderGreyWhite, width: 1.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: AppGeneral.user,
            builder: (BuildContext context, GalaxyUser? currentUser,
                    Widget? child) =>
                Column(
              children: [
                Hero(
                  tag: "profilePic",
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
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfilePicSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messageSnackBar(
                        message: AppStrings.profilePictureUpdatedSuccessfully.tr(),
                        ),
                      );
                    }
                    if (state is UpdateProfilePicFailuer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messageSnackBar(
                          message: state.message,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateProfilePicLoading) {
                      return SpinKitWave(
                        color: Colors.grey,
                        size: 30.w,
                      );
                    }
                    return TextButton(
                      onPressed: () async {
                        await context
                            .read<ProfileCubit>()
                            .pickImageFromGallery();
                      },
                      child: Text(
                      AppStrings.changePhoto.tr(),
                        style: TextStyles.font14White700w.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.offWhite),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 0.h),
                  child: EditTextField(
                  hintText: AppStrings.enterNewEmail.tr(),
                    labelText: currentUser.name!,
                    icon: Image.asset(AppIcons.email),
                    isSecure: false,
                    controller: ProfileCubit.nameController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: const ChangePasswordButton(),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0.h),
                    child: BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) async {
                        if (state is UpdateDataSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            messageSnackBar(
                            message:AppStrings. dataUpdatedSuccessfully.tr(),
                            ),
                          );
                          Navigator.pop(context);
                        }
                        if (state is UpdateDataFailuer) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            messageSnackBar(
                              message: state.message,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UpdateDataLoading) {
                          return GradientText(
                            colors: const [
                              AppColors.purple,
                              AppColors.blue,
                              AppColors.cyan,
                            ],
                            child: SpinKitWave(
                              color: Colors.grey,
                              size: 30.w,
                            ),
                          );
                        }
                        return EditGradientButton(
                        title:AppStrings.saveChanges.tr(),
                          onPressed: () {
                            if (ProfileCubit.nameController.text.isNotEmpty ||
                                ProfileCubit.emailController.text.isNotEmpty) {
                              context.read<ProfileCubit>().updateUserData();
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
