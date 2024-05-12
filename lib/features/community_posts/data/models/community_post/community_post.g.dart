// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityPost _$CommunityPostFromJson(Map<String, dynamic> json) =>
    CommunityPost(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      userPic: json['user_pic'] as String?,
      postText: json['post_text'] as String?,
      upVoteCount: (json['up_vote_count'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      upVoteCountLength: (json['up_vote_count_length'] as num?)?.toInt(),
      downVoteCount: (json['down_vote_count'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: json['date'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommunityPostToJson(CommunityPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_pic': instance.userPic,
      'post_text': instance.postText,
      'up_vote_count': instance.upVoteCount,
      'up_vote_count_length': instance.upVoteCountLength,
      'down_vote_count': instance.downVoteCount,
      'date': instance.date,
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
    };
