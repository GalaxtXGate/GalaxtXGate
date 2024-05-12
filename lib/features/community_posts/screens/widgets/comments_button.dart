import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/animations/bottom_slide_transition.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/posts_comments.dart';

class CommentsButton extends StatelessWidget {
  const CommentsButton({super.key, required this.post, this.isComments});
  final CommunityPost post;
  final bool? isComments;

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
                      if (isComments == null || !isComments!) {
                        await Navigator.push(
                          context,
                          BottomSlideTransition(
                            page: PostsComments(
                              post: post,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_rounded,
                          size: 20.w,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          post.comments!.length.toString(),
                          style: TextStyles.font12White700w,
                        ),
                        Text(
                          ' Comments'.tr(context),
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
