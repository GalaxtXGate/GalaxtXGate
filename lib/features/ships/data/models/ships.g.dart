// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ships _$ShipsFromJson(Map<String, dynamic> json) => Ships(
      legacyId: json['legacy_id'] as String?,
      type: json['type'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      homePort: json['home_port'] as String?,
      status: json['status'] as String?,
      yearBuilt: (json['year_built'] as num?)?.toInt(),
      link: json['link'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      launches: (json['launches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShipsToJson(Ships instance) => <String, dynamic>{
      'legacy_id': instance.legacyId,
      'type': instance.type,
      'roles': instance.roles,
      'home_port': instance.homePort,
      'status': instance.status,
      'year_built': instance.yearBuilt,
      'link': instance.link,
      'image': instance.image,
      'name': instance.name,
      'active': instance.active,
      'launches': instance.launches,
      'id': instance.id,
    };
