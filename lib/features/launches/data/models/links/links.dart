import 'package:galaxyxgate/features/launches/data/models/patch/patch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(explicitToJson: true)
class LaunchesLinks {
  Patch? patch;

  LaunchesLinks({this.patch,});

  factory LaunchesLinks.fromJson(Map<String, dynamic> json) =>
      _$LaunchesLinksFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchesLinksToJson(this);
}
