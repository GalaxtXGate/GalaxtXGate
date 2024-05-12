import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/buttons/more_button.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/comments_button.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/rows/profile_pic_with_name_and_date_in_post_card_row.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/rows/up_down_button_row.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.post,
    this.isComments,
  });
  final CommunityPost post;
  final bool? isComments;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final buttonKey = GlobalKey();

  ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: (widget.isComments != null && widget.isComments!)
                ? null
                : Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.w,
                  ),
          ),
          child: Column(
            children: [
              ProfilePicWithNameAndDateInPostCardRow(post: widget.post),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                valueListenable: isExpanded,
                builder: (BuildContext context, bool expanded, Widget? child) =>
                    GestureDetector(
                  onTap: () => isExpanded.value = !isExpanded.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.postText!,
                        style: TextStyles.font14White700w,
                        maxLines: expanded ? null : 6,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (widget.post.postText!.length > 50)
                        Text(
                          expanded
                              ? 'Read less....'.tr(context)
                              : 'Read more....'.tr(context),
                          style: TextStyles.font12White700w.copyWith(
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UpDownButtonRow(
                    post: widget.post,
                  ),
                  CommentsButton(
                    post: widget.post,
                    isComments: widget.isComments,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: AppGeneral.isArabic.value ? null : 20.w,
          left: AppGeneral.isArabic.value ? 20.w : null,
          child: MoreButton(
            buttonKey: buttonKey,
            context: context,
            post: widget.post,
            isComments: widget.isComments,
          ),
        ),
      ],
    );
  }
}
