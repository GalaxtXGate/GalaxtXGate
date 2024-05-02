class ShipsModel {
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

  ShipsModel(
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

  ShipsModel.fromJson(Map<String, dynamic> json) {
    legacyId = json['legacy_id'];
    type = json['type'];
    roles = json['roles'].cast<String>();
    homePort = json['home_port'];
    status = json['status'];
    yearBuilt = json['year_built'];
    link = json['link'];
    image = json['image'];
    name = json['name'];
    active = json['active'];
    launches = json['launches'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['legacy_id'] = legacyId;
    data['type'] = type;
    data['roles'] = roles;
    data['home_port'] = homePort;
    data['status'] = status;
    data['year_built'] = yearBuilt;
    data['link'] = link;
    data['image'] = image;
    data['name'] = name;
    data['active'] = active;
    data['launches'] = launches;
    data['id'] = id;
    return data;
  }
}
