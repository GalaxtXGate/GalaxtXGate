part of 'posts_comments_cubit.dart';

sealed class PostsCommentsState {}

final class CommunityPostsInitial extends PostsCommentsState {}

final class GetCommentsLoading extends PostsCommentsState {}

final class GetCommentsSuccess extends PostsCommentsState {
  List<Comment> comments;
  GetCommentsSuccess({required this.comments});
}

final class GetCommentsFailuer extends PostsCommentsState {
  String errorMessage;
  GetCommentsFailuer({required this.errorMessage});
}

final class AddCommentLoading extends PostsCommentsState {}

final class AddCommentSuccess extends PostsCommentsState {}

final class CommentFailuer extends PostsCommentsState {
  String errorMessage;
  CommentFailuer({required this.errorMessage});
}
