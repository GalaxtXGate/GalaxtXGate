import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/buttons/comment_option_button.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/rows/up_down_button_comment_row.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({
    super.key,
    required this.comment,
    required this.postId,
  });
  final Comment comment;
  final String postId;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  final buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePic(
            size: 35.w,
            userUrl: widget.comment.userPic,
            tag: "commentUserProfilePic_${widget.comment.id}",
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommentOptionButton(
                  buttonKey: buttonKey,
                  context: context,
                  comment: widget.comment,
                  postId: widget.postId,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.deepGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.comment.userName!,
                          style: TextStyles.font14White700w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          widget.comment.commentText!,
                          style: TextStyles.font12White700w,
                        ),
                      ],
                    ),
                  ),
                ),
                UpDownButtonCommentRow(
                  comment: widget.comment,
                  postId: widget.postId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
