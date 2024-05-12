import 'package:galaxyxgate/features/community_posts/data/models/comment/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_post.g.dart';

@JsonSerializable(explicitToJson: true)
class CommunityPost {
  String? id;
  String? userId;
  String? userName;
  String? userPic;
  String? postText;
  List<String>? upVoteCount;
  int? upVoteCountLength;
  List<String>? downVoteCount;
  String? date;
  List<Comment>? comments;

  CommunityPost({
    this.id,
    this.userId,
    this.userName,
    this.userPic,
    this.postText,
    this.upVoteCount,
    this.upVoteCountLength,
    this.downVoteCount,
    this.date,
    this.comments,
  });

  factory CommunityPost.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityPostToJson(this);
}
