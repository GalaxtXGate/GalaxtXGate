import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class UpDownButtonRow extends StatelessWidget {
  const UpDownButtonRow({super.key, required this.post});
  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.w,
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      await context
                          .read<CommunityPostsCubit>()
                          .updatePost(postId: post.id!, isUpVote: true);
                    },
                    child: Row(
                      children: [
                        post.upVoteCount!.contains(AppGeneral.user.value!.uid!)
                            ? GradientText(
                                colors: const [
                                  AppColors.purple,
                                  AppColors.blue,
                                  AppColors.cyan
                                ],
                                child: Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 20.w,
                                  color: AppColors.white,
                                ),
                              )
                            : Icon(
                                Icons.arrow_upward_rounded,
                                size: 20.w,
                                color: AppColors.white,
                              ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          post.upVoteCount!.length.toString(),
                          style: TextStyles.font12White700w,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                      width: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      await context
                          .read<CommunityPostsCubit>()
                          .updatePost(postId: post.id!, isUpVote: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_downward_rounded,
                          size: 20.w,
                          color: post.downVoteCount!
                                  .contains(AppGeneral.user.value!.uid!)
                              ? AppColors.redOrange
                              : AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          post.downVoteCount!.length.toString(),
                          style: TextStyles.font12White700w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
