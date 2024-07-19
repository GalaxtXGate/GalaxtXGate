import 'package:json_annotation/json_annotation.dart';

part 'headquarters.g.dart';

@JsonSerializable(explicitToJson: true)
class Headquarters {
  String? address;
  String? city;
  String? state;

  Headquarters({this.address, this.city, this.state});

  factory Headquarters.fromJson(Map<String, dynamic> json) =>
      _$HeadquartersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);
}
