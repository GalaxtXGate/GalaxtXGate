import 'package:json_annotation/json_annotation.dart';

part 'thrust_sea_level.g.dart';

@JsonSerializable(explicitToJson: true)
class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  factory ThrustSeaLevel.fromJson(Map<String, dynamic> json) =>
      _$ThrustSeaLevelFromJson(json);

  Map<String, dynamic> toJson() => _$ThrustSeaLevelToJson(this);
}
