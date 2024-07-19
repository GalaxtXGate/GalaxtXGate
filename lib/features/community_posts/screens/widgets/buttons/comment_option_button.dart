// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:share_plus/share_plus.dart';

class CommentOptionButton extends StatelessWidget {
  const CommentOptionButton({
    super.key,
    required this.buttonKey,
    required this.context,
    required this.comment,
    required this.postId,
    required this.child,
  });

  final GlobalKey<State<StatefulWidget>> buttonKey;
  final BuildContext context;
  final Comment comment;
  final String postId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: buttonKey,
      child: child,
      onLongPress: () async {
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
            if (comment.userId == AppGeneral.user.value!.uid)
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
              String postText = comment.commentText!;
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
                "GalaxyXGate\nComment from :${comment.userName}\n\"${comment.commentText}\"",
              );
            } else if (value == 'delete') {
              await getIt<PostsCommentsCubit>().deleteComment(
                context: context,
                postId: postId,
                commentId: comment.id!,
              );
              PostsCommentsCubit.comments.remove(comment);
              context.read<PostsCommentsCubit>().emit(
                    GetCommentsSuccess(
                      comments: PostsCommentsCubit.comments,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
