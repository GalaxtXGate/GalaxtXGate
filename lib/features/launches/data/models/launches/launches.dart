import 'package:galaxyxgate/features/launches/data/models/links/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launches.g.dart';

@JsonSerializable(explicitToJson: true)
class Launche {
  LaunchesLinks? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  String? details;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  bool? tbd;
  String? id;

  Launche({
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.details,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.tbd,
    this.id,
  });

  factory Launche.fromJson(Map<String, dynamic> json) =>
      _$LauncheFromJson(json);

  Map<String, dynamic> toJson() => _$LauncheToJson(this);
}
