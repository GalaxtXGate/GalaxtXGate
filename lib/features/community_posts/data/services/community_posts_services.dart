import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:galaxyxgate/features/community_posts/data/models/community_post/community_post.dart';
import '../../../../core/errors/server_failure.dart';

class CommunityPostsService {
  List<QueryDocumentSnapshot> data = [];
  Future<Either<ServerFailure, List<CommunityPost>>> getAllPosts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .orderBy('up_vote_count_length', descending: true)
          .get();

      List<CommunityPost> posts =
          await Future.wait(querySnapshot.docs.map((doc) async {
        var postData = doc.data() as Map<String, dynamic>;
        var commentsSnapshot = await doc.reference.collection('comments').get();
        var comments = commentsSnapshot.docs.map((commentDoc) {
          return Comment.fromJson(commentDoc.data());
        }).toList();
        var post = CommunityPost.fromJson(postData);
        post.comments = comments;
        return post;
      }).toList());

      return right(posts);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> addPost(
      {required CommunityPost post}) async {
    try {
      await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(post.id)
          .set(post.toJson());

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> updatePost({
    required String postId,
    required String userId,
    required bool isUpVote,
  }) async {
    try {
      List<String> upCountList = [];
      List<String> downCountList = [];

      CommunityPost post;
      var doc = await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .get();
      post = CommunityPost.fromJson(doc.data() as Map<String, dynamic>);
      upCountList = post.upVoteCount!;
      downCountList = post.downVoteCount!;
      if (isUpVote) {
        if (post.upVoteCount != null && !post.upVoteCount!.contains(userId)) {
          if (post.downVoteCount != null &&
              post.downVoteCount!.contains(userId)) {
            downCountList.remove(userId);
          }
          upCountList.add(userId);
        } else {
          upCountList.remove(userId);
        }
      } else {
        if (post.downVoteCount != null &&
            !post.downVoteCount!.contains(userId)) {
          if (post.upVoteCount != null && post.upVoteCount!.contains(userId)) {
            upCountList.remove(userId);
          }
          downCountList.add(userId);
        } else {
          downCountList.remove(userId);
        }
      }
      await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .update(
        {
          'up_vote_count': upCountList,
          'up_vote_count_length': upCountList.length,
          'down_vote_count': downCountList,
        },
      );

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> deletePost({
    required String id,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(id)
          .delete();

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, List<Comment>>> getAllComments(
      {required String postId}) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .collection('comments')
          .orderBy('up_vote_count_length', descending: true)
          .get();

      List<Comment> comments = querySnapshot.docs
          .map((doc) => Comment.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return right(comments);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> addComment({
    required Comment comment,
    required String postId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .collection('comments')
          .doc(comment.id)
          .set(comment.toJson());

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, void>> updateComment({
    required String postId,
    required String commentId,
    required String userId,
    required bool isUpVote,
  }) async {
    try {
      List<String> upCountList = [];
      List<String> downCountList = [];

      CommunityPost post;
      var doc = await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .get();
      post = CommunityPost.fromJson(doc.data() as Map<String, dynamic>);
      upCountList = post.upVoteCount!;
      downCountList = post.downVoteCount!;
      if (isUpVote) {
        if (post.upVoteCount != null && !post.upVoteCount!.contains(userId)) {
          if (post.downVoteCount != null &&
              post.downVoteCount!.contains(userId)) {
            downCountList.remove(userId);
          }
          upCountList.add(userId);
        } else {
          upCountList.remove(userId);
        }
      } else {
        if (post.downVoteCount != null &&
            !post.downVoteCount!.contains(userId)) {
          if (post.upVoteCount != null && post.upVoteCount!.contains(userId)) {
            upCountList.remove(userId);
          }
          downCountList.add(userId);
        } else {
          downCountList.remove(userId);
        }
      }
      await FirebaseFirestore.instance
          .collection('CommunityPosts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .update(
        {
          'up_vote_count': upCountList,
          'up_vote_count_length': upCountList.length,
          'down_vote_count': downCountList,
        },
      );

      return right(null);
    } on FirebaseException catch (_, error) {
      return left(ServerFailure(errMessage: error.toString()));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
