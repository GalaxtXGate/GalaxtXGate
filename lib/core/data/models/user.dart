import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class GalaxyUser {
  String? uid;
  String? name;
  String? email;
  String? profilePic;
  String? joindate;

  GalaxyUser({
    this.uid,
    this.name,
    this.email,
    this.profilePic,
    this.joindate,
  });

  factory GalaxyUser.fromJson(Map<String, dynamic> json) =>
      _$GalaxyUserFromJson(json);

  Map<String, dynamic> toJson() => _$GalaxyUserToJson(this);
}
