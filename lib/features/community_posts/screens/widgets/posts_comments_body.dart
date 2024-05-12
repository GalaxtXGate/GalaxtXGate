import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/cards/comment_card.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/cards/post_card.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/place_holders/comments_place_holder.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/text_fields/add_comment_text_field.dart';

class PostsCommentsBody extends StatelessWidget {
  const PostsCommentsBody({super.key, required this.post});
  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        PostsCommentsCubit.comments = [];
        PostsCommentsCubit.commentController.clear();
      },
      child: GradientGreyBackground(
        child: BlocBuilder<CommunityPostsCubit, CommunityPostsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(top: 40.w),
              child: RefreshIndicator(
                onRefresh: () async {
                  await context
                      .read<PostsCommentsCubit>()
                      .getAllComments(postId: post.id!);
                },
                child: ListView(
                  children: [
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    PostCard(
                      post: CommunityPostsCubit.posts
                          .firstWhere((element) => element.id == post.id),
                      isComments: true,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    BlocBuilder<PostsCommentsCubit, PostsCommentsState>(
                      builder: (context, state) {
                        if (state is GetCommentsLoading) {
                          return const CommentsPlaceHolder();
                        }
                        return PostsCommentsCubit.comments.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: PostsCommentsCubit.comments.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: CommentCard(
                                            comment: PostsCommentsCubit
                                                .comments[index],
                                            postId: post.id!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView(
                                shrinkWrap: true, // Add this line
                                children: [
                                  SizedBox(
                                    height: 300.h,
                                    child: Center(
                                      child: Text(
                                        'No Comments Yet'.tr(context),
                                        style: TextStyles.font14White700w,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    AddCommentTextField(post: post),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
