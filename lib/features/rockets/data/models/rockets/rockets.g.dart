// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rockets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rockets _$RocketsFromJson(Map<String, dynamic> json) => Rockets(
      engines: json['engines'] == null
          ? null
          : Engines.fromJson(json['engines'] as Map<String, dynamic>),
      flickrImages: (json['flickr_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      stages: (json['stages'] as num?)?.toInt(),
      boosters: (json['boosters'] as num?)?.toInt(),
      costPerLaunch: (json['cost_per_launch'] as num?)?.toInt(),
      successRatePct: (json['success_rate_pct'] as num?)?.toInt(),
      firstFlight: json['first_flight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      isExpanded: json['is_expanded'] as bool? ?? false,
    );

Map<String, dynamic> _$RocketsToJson(Rockets instance) => <String, dynamic>{
      'engines': instance.engines?.toJson(),
      'flickr_images': instance.flickrImages,
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'cost_per_launch': instance.costPerLaunch,
      'success_rate_pct': instance.successRatePct,
      'first_flight': instance.firstFlight,
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
      'is_expanded': instance.isExpanded,
    };
