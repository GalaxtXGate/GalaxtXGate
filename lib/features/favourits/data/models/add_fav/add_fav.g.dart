// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_fav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFav _$AddFavFromJson(Map<String, dynamic> json) => AddFav(
      id: json['id'] as String?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      launchNum: json['launch_num'] as String?,
      org: json['org'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AddFavToJson(AddFav instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'launch_num': instance.launchNum,
      'org': instance.org,
      'status': instance.status,
    };
