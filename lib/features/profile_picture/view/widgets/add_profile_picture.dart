import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_strings.dart';
import 'package:galaxyxgate/features/profile_picture/logic/cubits/profile_picture_cubit.dart';

class AddProfilePicture extends StatelessWidget {
  const AddProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  color: AppColors.deepGrey,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderGrey, width: 0.5)),
              child: Center(
                child: state is ProfilePictureSelected
                    ? ClipOval(
                        child: Image.file(state.selectedImage,
                            width: 140, height: 140, fit: BoxFit.cover),
                      )
                    : ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              AppColors.loginTextGradientPurple,
                              AppColors.loginTextGradientBlue,
                              AppColors.loginTextGradientGreen,
                            ],
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 175,
              child: TextButton(
                onPressed: () =>
                    context.read<ProfilePictureCubit>().pickImageFromGallery(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.addPicture.tr(),
                      style: TextStyles.textStyle14300,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColors.lightGrey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
