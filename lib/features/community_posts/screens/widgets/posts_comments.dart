import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/posts_comments_body.dart';

class PostsComments extends StatelessWidget {
  const PostsComments({super.key, required this.post, r});
  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CommunityPostsCubit>(),
        ),
        BlocProvider.value(
          value: getIt<PostsCommentsCubit>()..getAllComments(postId: post.id!),
        ),
      ],
      child: PostsCommentsBody(
        post: post,
      ),
    );
  }
}
