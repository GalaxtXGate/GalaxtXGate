class Launche {
  Links? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  String? details;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  bool? tbd;
  String? id;

  Launche(
      {this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.details,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.tbd,
      this.id});

  Launche.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    details = json['details'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    tbd = json['tbd'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['static_fire_date_utc'] = staticFireDateUtc;
    data['static_fire_date_unix'] = staticFireDateUnix;
    data['net'] = net;
    data['window'] = window;
    data['rocket'] = rocket;
    data['success'] = success;
    data['details'] = details;
    data['flight_number'] = flightNumber;
    data['name'] = name;
    data['date_utc'] = dateUtc;
    data['date_unix'] = dateUnix;
    data['date_local'] = dateLocal;
    data['date_precision'] = datePrecision;
    data['upcoming'] = upcoming;
    data['tbd'] = tbd;
    data['id'] = id;
    return data;
  }
}

class Links {
  Patch? patch;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links({this.patch, this.youtubeId, this.article, this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (patch != null) {
      data['patch'] = patch!.toJson();
    }
    data['youtube_id'] = youtubeId;
    data['article'] = article;
    data['wikipedia'] = wikipedia;
    return data;
  }
}

class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}
