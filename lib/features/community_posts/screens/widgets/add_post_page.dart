import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/core/widgets/snackbars/message_snack_bar.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/add_post_header_with_profile_pic.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';
import 'package:galaxyxgate/features/profile/screens/widgets/edit_button.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientGreyBackground(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 50.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30.w,
                      color: AppColors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    height: 40.h,
                    child: BlocProvider.value(
                      value: getIt<CommunityPostsCubit>(),
                      child: BlocConsumer<CommunityPostsCubit,
                          CommunityPostsState>(
                        listener: (context, state) {
                          if (state is PostFailuer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              messageSnackBar(
                                message: state.errorMessage,
                              ),
                            );
                          }
                          if (state is AddPostSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              messageSnackBar(
                                message: 'Post added successfully'.tr(context),
                              ),
                            );
                            Navigator.pop(context);
                            CommunityPostsCubit.postController.clear();
                          }
                        },
                        builder: (context, state) {
                          if (state is AddPostLoading) {
                            return GradientText(
                              colors: const [
                                AppColors.purple,
                                AppColors.blue,
                                AppColors.cyan
                              ],
                              child: SpinKitWave(
                                color: Colors.white,
                                size: 30.w,
                              ),
                            );
                          }
                          return EditGradientButton(
                            onPressed: () async {
                              if (CommunityPostsCubit
                                  .postController.text.isNotEmpty) {
                                await context
                                    .read<CommunityPostsCubit>()
                                    .addPost(
                                      post: CommunityPost(
                                        id: DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        userId: AppGeneral.user.value!.uid,
                                        userName: AppGeneral.user.value!.name,
                                        userPic:
                                            AppGeneral.user.value!.profilePic,
                                        postText: CommunityPostsCubit
                                            .postController.text,
                                        upVoteCount: [],
                                        upVoteCountLength: 0,
                                        downVoteCount: [],
                                        comments: [],
                                        date: DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString(),
                                      ),
                                    );
                              }
                            },
                            title: 'post'.tr(context),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const AddPostbodyWithProfilePic(),
            ],
          ),
        ),
      )),
    );
  }
}
