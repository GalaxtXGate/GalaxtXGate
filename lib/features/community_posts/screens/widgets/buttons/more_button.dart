// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:share_plus/share_plus.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.buttonKey,
    required this.context,
    required this.post,
    this.isComments,
  });

  final GlobalKey<State<StatefulWidget>> buttonKey;
  final BuildContext context;
  final CommunityPost post;
  final bool? isComments;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: buttonKey,
      onPressed: () async {
        final RenderBox button =
            buttonKey.currentContext!.findRenderObject() as RenderBox;
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(button.size.bottomRight(Offset.zero),
                ancestor: overlay),
            button.localToGlobal(button.size.bottomLeft(Offset.zero),
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu(
          context: context,
          position: position,
          color: AppColors.deepGrey,
          items: [
            PopupMenuItem(
              value: 'copy',
              child: Center(
                child: Text(
                  'copy'.tr(context),
                  style: TextStyles.font12White700w,
                ),
              ),
            ),
            PopupMenuItem(
              value: 'share',
              child: Center(
                child: Text(
                  'share'.tr(context),
                  style: TextStyles.font12White700w,
                ),
              ),
            ),
            if (post.userId == AppGeneral.user.value!.uid)
              PopupMenuItem(
                value: 'delete',
                child: Center(
                  child: Text(
                    'delete'.tr(context),
                    style: TextStyles.font12White700w,
                  ),
                ),
              ),
          ],
          elevation: 8,
        ).then(
          (value) async {
            if (value == 'copy') {
              String postText = post.postText!;
              Clipboard.setData(ClipboardData(text: postText));
              Fluttertoast.showToast(
                msg: 'Copied to clipboard'.tr(context),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: AppColors.deepGrey,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            } else if (value == 'share') {
              Share.share(
                "GalaxyXGate\nPost from :${post.userName}\n\"${post.postText}\"",
              );
            } else if (value == 'delete') {
              await getIt<CommunityPostsCubit>().deletePost(
                context: context,
                id: post.id!,
              );
              Navigator.pop(context);
            }
          },
        );
      },
      icon: Icon(
        Icons.more_horiz_rounded,
        color: Colors.grey,
        size: 25.w,
      ),
    );
  }
}
