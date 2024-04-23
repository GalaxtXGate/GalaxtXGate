class ShipsModel {
  Null lastAisUpdate;
  String? legacyId;
  Null model;
  String? type;
  List<String>? roles;

  String? homePort;
  String? status;
  Null speedKn;
  Null courseDeg;
  Null latitude;
  Null longitude;
  String? link;
  String? image;
  String? name;
  bool? active;
  List<String>? launches;
  String? id;

  ShipsModel(
      {this.lastAisUpdate,
      this.legacyId,
      this.model,
      this.type,
      this.roles,
      this.homePort,
      this.status,
      this.speedKn,
      this.courseDeg,
      this.latitude,
      this.longitude,
      this.link,
      this.image,
      this.name,
      this.active,
      this.launches,
      this.id});

  ShipsModel.fromJson(Map<String, dynamic> json) {
    lastAisUpdate = json['last_ais_update'];
    legacyId = json['legacy_id'];
    model = json['model'];
    type = json['type'];
    roles = json['roles'].cast<String>();
    homePort = json['home_port'];
    status = json['status'];
    speedKn = json['speed_kn'];
    courseDeg = json['course_deg'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    link = json['link'];
    image = json['image'];
    name = json['name'];
    active = json['active'];
    launches = json['launches'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_ais_update'] = lastAisUpdate;
    data['legacy_id'] = legacyId;
    data['model'] = model;
    data['type'] = type;
    data['roles'] = roles;

    data['home_port'] = homePort;
    data['status'] = status;
    data['speed_kn'] = speedKn;
    data['course_deg'] = courseDeg;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['link'] = link;
    data['image'] = image;
    data['name'] = name;
    data['active'] = active;
    data['launches'] = launches;
    data['id'] = id;
    return data;
  }
}
