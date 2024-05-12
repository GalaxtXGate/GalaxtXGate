part of 'community_posts_cubit.dart';

sealed class CommunityPostsState {}

final class CommunityPostsInitial extends CommunityPostsState {}

final class GetPostsLoading extends CommunityPostsState {}

final class GetPostsSuccess extends CommunityPostsState {
  List<CommunityPost> posts;
  GetPostsSuccess({required this.posts});
}

final class GetPostsFailuer extends CommunityPostsState {
  String errorMessage;
  GetPostsFailuer({required this.errorMessage});
}

final class AddPostLoading extends CommunityPostsState {}

final class AddPostSuccess extends CommunityPostsState {}

final class PostFailuer extends CommunityPostsState {
  String errorMessage;
  PostFailuer({required this.errorMessage});
}

final class DeletePostSuccess extends CommunityPostsState {}

final class DeletePostFailuer extends CommunityPostsState {
  String errorMessage;
  DeletePostFailuer({required this.errorMessage});
}
