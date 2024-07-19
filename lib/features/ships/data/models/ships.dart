import 'package:json_annotation/json_annotation.dart';

part 'ships.g.dart';

@JsonSerializable(explicitToJson: true)
class Ships {
  String? legacyId;
  String? type;
  List<String>? roles;
  String? homePort;
  String? status;
  int? yearBuilt;
  String? link;
  String? image;
  String? name;
  bool? active;
  List<String>? launches;
  String? id;

  Ships(
      {this.legacyId,
      this.type,
      this.roles,
      this.homePort,
      this.status,
      this.yearBuilt,
      this.link,
      this.image,
      this.name,
      this.active,
      this.launches,
      this.id});

  factory Ships.fromJson(Map<String, dynamic> json) => _$ShipsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipsToJson(this);
}
