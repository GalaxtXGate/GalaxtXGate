import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/home/view/widgets/profile_pic.dart';

class AddPostbodyWithProfilePic extends StatelessWidget {
  const AddPostbodyWithProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfilePic(
              size: 40.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              AppGeneral.user.value!.name!,
              style: TextStyles.font16White700w,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        TextField(
          controller: CommunityPostsCubit.postController,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'What’s on your mind ?'.tr(context),
            hintStyle: TextStyles.font24White700w.copyWith(
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
          style: TextStyles.font12White700w,
        ),
      ],
    );
  }
}
