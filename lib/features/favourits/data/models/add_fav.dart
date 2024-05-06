import 'package:json_annotation/json_annotation.dart';

part 'add_fav.g.dart';

@JsonSerializable(explicitToJson: true)
class AddFav{
  String? id;
  String? category;
  String? name;
  String? description;
  String? image;
  String? launchNum;
  String? org;
  String? status;

  AddFav({
    this.id,
    this.category,
    this.name,
    this.image,
    this.description,
    this.launchNum,
    this.org,
    this.status,
  });

  factory AddFav.fromJson(Map<String, dynamic> json) =>
      _$AddFavFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavToJson(this);
}
