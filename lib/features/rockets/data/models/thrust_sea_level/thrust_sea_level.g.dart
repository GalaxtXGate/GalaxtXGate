// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thrust_sea_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThrustSeaLevel _$ThrustSeaLevelFromJson(Map<String, dynamic> json) =>
    ThrustSeaLevel(
      kN: (json['k_n'] as num?)?.toInt(),
      lbf: (json['lbf'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ThrustSeaLevelToJson(ThrustSeaLevel instance) =>
    <String, dynamic>{
      'k_n': instance.kN,
      'lbf': instance.lbf,
    };
