import 'package:galaxyxgate/features/rockets/data/models/thrust_sea_level/thrust_sea_level.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engines.g.dart';

@JsonSerializable(explicitToJson: true)
class Engines {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  int? thrustToWeight;

  Engines(
      {this.thrustSeaLevel,
      this.thrustVacuum,
      this.number,
      this.type,
      this.version,
      this.layout,
      this.engineLossMax,
      this.propellant1,
      this.propellant2,
      this.thrustToWeight});
  factory Engines.fromJson(Map<String, dynamic> json) =>
      _$EnginesFromJson(json);

  Map<String, dynamic> toJson() => _$EnginesToJson(this);
}
