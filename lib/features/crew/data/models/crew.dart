import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(explicitToJson: true)
class Crew {
  late String name;
  late String agency;
  late String image;
  late String wikipedia;
  late List<String> launches;
  late String status;
  late String id;

  Crew(
      {required this.name,
      required this.agency,
      required this.image,
      required this.wikipedia,
      required this.launches,
      required this.status,
      required this.id});
  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
