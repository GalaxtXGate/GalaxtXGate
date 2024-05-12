// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      userPic: json['user_pic'] as String?,
      commentText: json['comment_text'] as String?,
      upVoteCount: (json['up_vote_count'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      upVoteCountLength: (json['up_vote_count_length'] as num?)?.toInt(),
      downVoteCount: (json['down_vote_count'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_pic': instance.userPic,
      'comment_text': instance.commentText,
      'up_vote_count': instance.upVoteCount,
      'up_vote_count_length': instance.upVoteCountLength,
      'down_vote_count': instance.downVoteCount,
      'date': instance.date,
    };
