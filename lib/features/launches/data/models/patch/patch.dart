import 'package:json_annotation/json_annotation.dart';

part 'patch.g.dart';

@JsonSerializable()
class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchToJson(this);

}
