import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ships.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
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
      {@HiveField(0) this.legacyId,
      @HiveField(1) this.type,
      @HiveField(2) this.roles,
      @HiveField(3) this.homePort,
      @HiveField(4) this.status,
      @HiveField(5) this.yearBuilt,
      @HiveField(6) this.link,
      @HiveField(7) this.image,
      @HiveField(8) this.name,
      @HiveField(9) this.active,
      @HiveField(10) this.launches,
      @HiveField(11) this.id});

  factory Ships.fromJson(Map<String, dynamic> json) => _$ShipsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipsToJson(this);
}
