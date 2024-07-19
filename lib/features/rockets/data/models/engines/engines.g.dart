// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Engines _$EnginesFromJson(Map<String, dynamic> json) => Engines(
      thrustSeaLevel: json['thrust_sea_level'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrust_sea_level'] as Map<String, dynamic>),
      thrustVacuum: json['thrust_vacuum'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrust_vacuum'] as Map<String, dynamic>),
      number: (json['number'] as num?)?.toInt(),
      type: json['type'] as String?,
      version: json['version'] as String?,
      layout: json['layout'] as String?,
      engineLossMax: (json['engine_loss_max'] as num?)?.toInt(),
      propellant1: json['propellant1'] as String?,
      propellant2: json['propellant2'] as String?,
      thrustToWeight: (json['thrust_to_weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnginesToJson(Engines instance) => <String, dynamic>{
      'thrust_sea_level': instance.thrustSeaLevel?.toJson(),
      'thrust_vacuum': instance.thrustVacuum?.toJson(),
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'layout': instance.layout,
      'engine_loss_max': instance.engineLossMax,
      'propellant1': instance.propellant1,
      'propellant2': instance.propellant2,
      'thrust_to_weight': instance.thrustToWeight,
    };
