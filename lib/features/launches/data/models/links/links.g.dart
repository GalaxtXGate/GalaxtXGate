// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchesLinks _$LaunchesLinksFromJson(Map<String, dynamic> json) =>
    LaunchesLinks(
      patch: json['patch'] == null
          ? null
          : Patch.fromJson(json['patch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LaunchesLinksToJson(LaunchesLinks instance) =>
    <String, dynamic>{
      'patch': instance.patch?.toJson(),
    };
