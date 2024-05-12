import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galaxyxgate/core/errors/server_failure.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/app_colors.dart';
import 'package:galaxyxgate/core/utils/app_general.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import 'package:galaxyxgate/features/community_posts/data/services/community_posts_services.dart';
part 'community_posts_state.dart';

class CommunityPostsCubit extends Cubit<CommunityPostsState> {
  CommunityPostsCubit({required CommunityPostsService communityPostsService})
      : super(CommunityPostsInitial()) {
    _communityPostsService = communityPostsService;
  }

  late CommunityPostsService _communityPostsService;
  static List<CommunityPost> posts = [];

  static TextEditingController postController = TextEditingController();

  Future<void> getAllPosts() async {
    posts.isEmpty ? emit(GetPostsLoading()) : null;
    Either<ServerFailure, List<CommunityPost>> result =
        await _communityPostsService.getAllPosts();
    result.fold(
      (failure) => emit(
        GetPostsFailuer(
          errorMessage: failure.errMessage,
        ),
      ),
      (newPosts) {
        if (posts != newPosts) {
          posts = newPosts;
        }
        emit(
          GetPostsSuccess(posts: newPosts),
        );
      },
    );
  }

  Future<void> addPost({
    required CommunityPost post,
  }) async {
    emit(AddPostLoading());
    Either<ServerFailure, void> result =
        await _communityPostsService.addPost(post: post);
    result.fold(
      (failure) => emit(
        PostFailuer(errorMessage: failure.errMessage),
      ),
      (_) {
        getAllPosts();
        emit(
          AddPostSuccess(),
        );
      },
    );
  }

  Future<void> updatePost({
    required String postId,
    required bool isUpVote,
  }) async {
    Either<ServerFailure, void> result =
        await _communityPostsService.updatePost(
      postId: postId,
      userId: AppGeneral.user.value!.uid!,
      isUpVote: isUpVote,
    );
    result.fold(
      (failure) => emit(
        PostFailuer(errorMessage: failure.errMessage),
      ),
      (_) => getAllPosts(),
    );
  }

  Future<void> deletePost({
    required BuildContext context,
    required String id,
  }) async {
    emit(AddPostLoading());
    Either<ServerFailure, void> result =
        await _communityPostsService.deletePost(id: id);
    result.fold(
      (failure) => emit(
        PostFailuer(errorMessage: failure.errMessage),
      ),
      (_) {
        getAllPosts();
        Fluttertoast.showToast(
          msg: 'Post Deleted Successfully'.tr(context),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.deepGrey,
          textColor: Colors.white,
          fontSize: 16.w,
        );
      },
    );
  }
}
