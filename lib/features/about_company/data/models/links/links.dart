import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(explicitToJson: true)
class Links {
  String? website;
  String? flickr;
  String? twitter;
  String? elonTwitter;

  Links({this.website, this.flickr, this.twitter, this.elonTwitter});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
