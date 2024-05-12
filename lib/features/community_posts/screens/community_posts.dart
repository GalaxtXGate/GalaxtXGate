import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxyxgate/core/di/dependency_injection.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/screens/community_posts_body.dart';

class CommunityPosts extends StatelessWidget {
  const CommunityPosts({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CommunityPostsCubit>()..getAllPosts(),
      child: CommunityPostsBody(
        scrollController: scrollController,
      ),
    );
  }
}
