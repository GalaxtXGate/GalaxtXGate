import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/core/widgets/snackbars/message_snack_bar.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class AddCommentTextField extends StatelessWidget {
  const AddCommentTextField({
    super.key,
    required this.post,
  });
  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.deepGrey,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: PostsCommentsCubit.commentController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write a comment'.tr(context),
                hintStyle: TextStyles.font12White700w.copyWith(
                  color: Colors.grey,
                ),
              ),
              style: TextStyles.font14White700w,
            ),
          ),
          BlocConsumer<PostsCommentsCubit, PostsCommentsState>(
            listener: (context, state) {
              if (state is CommentFailuer) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    messageSnackBar(
                      message: state.errorMessage,
                    ),
                  );
              }
              if (state is AddCommentSuccess) {
                PostsCommentsCubit.commentController.clear();

                getIt<PostsCommentsCubit>().getAllComments(postId: post.id!);
                getIt<CommunityPostsCubit>().getAllPosts();
              }
            },
            builder: (context, state) {
              if (state is AddCommentLoading) {
                return GradientText(
                  colors: const [
                    AppColors.purple,
                    AppColors.blue,
                    AppColors.cyan,
                  ],
                  child: SpinKitWave(
                    color: Colors.grey,
                    size: 25.w,
                  ),
                );
              }
              return Stack(
                children: [
                  Container(
                    height: 50.w,
                    width: 50.w,
                    decoration: const BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned.fill(
                      child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          if (PostsCommentsCubit
                              .commentController.text.isNotEmpty) {
                            getIt<PostsCommentsCubit>().addComment(
                              comment: Comment(
                                id: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                                date: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                                userId: AppGeneral.user.value!.uid,
                                userName: AppGeneral.user.value!.name,
                                userPic: AppGeneral.user.value!.profilePic,
                                downVoteCount: [],
                                upVoteCount: [],
                                upVoteCountLength: 0,
                                commentText:
                                    PostsCommentsCubit.commentController.text,
                              ),
                              postId: post.id!,
                            );
                          }
                        },
                        child: Icon(
                          Icons.arrow_right_rounded,
                          color: AppColors.white,
                          size: 50.w,
                        ),
                      ),
                    ),
                  ))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
