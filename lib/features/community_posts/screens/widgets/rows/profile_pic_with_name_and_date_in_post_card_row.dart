import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/helpers/date_time_handler.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';
import 'package:galaxyxgate/features/onboarding/screens/widget/gradient_Text.dart';

class ProfilePicWithNameAndDateInPostCardRow extends StatelessWidget {
  const ProfilePicWithNameAndDateInPostCardRow({
    super.key,
    required this.post,
  });

  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProfilePic(
          size: 50.w,
          userUrl: post.userPic,
          tag: "PostUserProfilePic_${post.id}",
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (post.userId == AppGeneral.user.value!.uid)
                  Row(
                    children: [
                      GradientText(
                        colors: const [
                          AppColors.purple,
                          AppColors.blue,
                          AppColors.cyan
                        ],
                        child: Text(
                          "you".tr(context),
                          style: TextStyles.font12White700w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                Text(
                  post.userName!,
                  style: TextStyles.font16White700w,
                ),
              ],
            ),
            Text(
              DateTimeHandler.getMessageTime(
                context: context,
                time: post.date!,
              ),
              style: TextStyles.font12White700w.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
