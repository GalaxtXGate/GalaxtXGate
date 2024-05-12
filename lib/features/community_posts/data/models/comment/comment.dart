import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  String? id;
  String? userId;
  String? userName;
  String? userPic;
  String? commentText;
  List<String>? upVoteCount;
  int? upVoteCountLength;
  List<String>? downVoteCount;
  String? date;

  Comment({
    this.id,
    this.userId,
    this.userName,
    this.userPic,
    this.commentText,
    this.upVoteCount,
    this.upVoteCountLength,
    this.downVoteCount,
    this.date,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
