import 'package:galaxyxgate/features/rockets/data/models/engines/engines.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rockets.g.dart';

@JsonSerializable(explicitToJson: true)
class Rockets {
  Engines? engines;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;
  bool? isExpanded;
  Rockets({
    this.engines,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
    this.isExpanded = false,
  });

  factory Rockets.fromJson(Map<String, dynamic> json) =>
      _$RocketsFromJson(json);

  Map<String, dynamic> toJson() => _$RocketsToJson(this);
}
