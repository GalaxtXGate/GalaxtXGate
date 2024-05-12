import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/data/services/community_posts_services.dart';
part 'posts_comments_state.dart';

class PostsCommentsCubit extends Cubit<PostsCommentsState> {
  PostsCommentsCubit({required CommunityPostsService communityPostsService})
      : super(CommunityPostsInitial()) {
    _communityPostsService = communityPostsService;
  }

  late CommunityPostsService _communityPostsService;
  static List<Comment> comments = [];

  static TextEditingController commentController = TextEditingController();

  Future<void> getAllComments({required String postId}) async {
    comments.isEmpty ? emit(GetCommentsLoading()) : null;
    Either<ServerFailure, List<Comment>> result =
        await _communityPostsService.getAllComments(postId: postId);
    result.fold(
      (failure) => emit(
        GetCommentsFailuer(
          errorMessage: failure.errMessage,
        ),
      ),
      (newComments) {
        if (comments != newComments) {
          comments = newComments;
        }
        emit(
          GetCommentsSuccess(comments: newComments),
        );
      },
    );
  }

  Future<void> addComment({
    required Comment comment,
    required String postId,
  }) async {
    emit(AddCommentLoading());
    Either<ServerFailure, void> result = await _communityPostsService
        .addComment(comment: comment, postId: postId);
    result.fold(
      (failure) => emit(
        CommentFailuer(errorMessage: failure.errMessage),
      ),
      (_) {
        getAllComments(postId: postId);
        emit(
          AddCommentSuccess(),
        );
      },
    );
  }

  Future<void> updateComment({
    required String postId,
    required String commentId,
    required bool isUpVote,
  }) async {
    Either<ServerFailure, void> result =
        await _communityPostsService.updateComment(
      postId: postId,
      commentId: commentId,
      userId: AppGeneral.user.value!.uid!,
      isUpVote: isUpVote,
    );
    result.fold(
      (failure) => emit(
        CommentFailuer(errorMessage: failure.errMessage),
      ),
      (_) => getAllComments(postId: postId),
    );
  }
}
