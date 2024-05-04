// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launche _$LauncheFromJson(Map<String, dynamic> json) => Launche(
      links: json['links'] == null
          ? null
          : LaunchesLinks.fromJson(json['links'] as Map<String, dynamic>),
      staticFireDateUtc: json['static_fire_date_utc'] as String?,
      staticFireDateUnix: (json['static_fire_date_unix'] as num?)?.toInt(),
      net: json['net'] as bool?,
      window: (json['window'] as num?)?.toInt(),
      rocket: json['rocket'] as String?,
      success: json['success'] as bool?,
      details: json['details'] as String?,
      flightNumber: (json['flight_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      dateUtc: json['date_utc'] as String?,
      dateUnix: (json['date_unix'] as num?)?.toInt(),
      dateLocal: json['date_local'] as String?,
      datePrecision: json['date_precision'] as String?,
      upcoming: json['upcoming'] as bool?,
      tbd: json['tbd'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LauncheToJson(Launche instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'static_fire_date_utc': instance.staticFireDateUtc,
      'static_fire_date_unix': instance.staticFireDateUnix,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.dateUtc,
      'date_unix': instance.dateUnix,
      'date_local': instance.dateLocal,
      'date_precision': instance.datePrecision,
      'upcoming': instance.upcoming,
      'tbd': instance.tbd,
      'id': instance.id,
    };
