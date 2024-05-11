import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/data/models/user.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/core/widgets/defult_app_cached_network_image.dart';
import 'package:galaxyxgate/core/widgets/message_snack_bar.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/buttons/change_password_button.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: AppGeneral.user,
          builder:
              (BuildContext context, GalaxyUser? currentUser, Widget? child) =>
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
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfilePicSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      messageSnackBar(
                        message: AppStrings.profilePictureUpdatedSuccessfully
                            .tr(context),
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
                      await context.read<ProfileCubit>().pickImageFromGallery();
                    },
                    child: Text(
                      AppStrings.changePhoto.tr(context),
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
                  hintText: AppStrings.enterNewEmail.tr(context),
                  labelText: currentUser.name!,
                  controller: ProfileCubit.nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 100.h),
                child: const ChangePasswordButton(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0.h),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) async {
                    if (state is UpdateDataSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messageSnackBar(
                          message:
                              AppStrings.dataUpdatedSuccessfully.tr(context),
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
                      title: AppStrings.saveChanges.tr(context),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
