// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalaxyUser _$GalaxyUserFromJson(Map<String, dynamic> json) => GalaxyUser(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePic: json['profile_pic'] as String?,
      joindate: json['joindate'] as String?,
    );

Map<String, dynamic> _$GalaxyUserToJson(GalaxyUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profile_pic': instance.profilePic,
      'joindate': instance.joindate,
    };
