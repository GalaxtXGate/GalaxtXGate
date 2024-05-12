import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/date_time_handler.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class UpDownButtonCommentRow extends StatelessWidget {
  const UpDownButtonCommentRow(
      {super.key, required this.comment, required this.postId});
  final Comment comment;
  final String postId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Row(
            children: [
              Text(
                DateTimeHandler.getMessageTime(
                    context: context, time: comment.date!),
                style: TextStyles.font12White700w,
              ),
              TextButton(
                onPressed: () async {
                  await getIt<PostsCommentsCubit>().updateComment(
                    postId: postId,
                    commentId: comment.id!,
                    isUpVote: true,
                  );
                },
                child: Row(
                  children: [
                    comment.upVoteCount!.contains(AppGeneral.user.value!.uid!)
                        ? GradientText(
                            colors: const [
                              AppColors.purple,
                              AppColors.blue,
                              AppColors.cyan
                            ],
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              size: 15.w,
                              color: AppColors.white,
                            ),
                          )
                        : Icon(
                            Icons.arrow_upward_rounded,
                            size: 15.w,
                            color: AppColors.white,
                          ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      comment.upVoteCount!.length.toString(),
                      style: TextStyles.font12White700w,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  await getIt<PostsCommentsCubit>().updateComment(
                    postId: postId,
                    commentId: comment.id!,
                    isUpVote: false,
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_downward_rounded,
                      size: 15.w,
                      color: comment.downVoteCount!
                              .contains(AppGeneral.user.value!.uid!)
                          ? AppColors.redOrange
                          : AppColors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      comment.downVoteCount!.length.toString(),
                      style: TextStyles.font12White700w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
