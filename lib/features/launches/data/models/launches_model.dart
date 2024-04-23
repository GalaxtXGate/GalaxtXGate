class Launches {
  Fairings? fairings;
  Links? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<Failures>? failures;
  String? details;
  List<String>? crew;
  List<String>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Cores>? cores;
  bool? autoUpdate;
  bool? tbd;
  Null launchLibraryId;
  String? id;

  Launches(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.autoUpdate,
      this.tbd,
      this.launchLibraryId,
      this.id});

  Launches.fromJson(Map<String, dynamic> json) {
    fairings =
        json['fairings'] != null ? Fairings.fromJson(json['fairings']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    if (json['failures'] != null) {
      failures = <Failures>[];
      json['failures'].forEach((v) {
        failures!.add(Failures.fromJson(v));
      });
    }
    details = json['details'];
    if (json['crew'] != null) {
      crew = List<String>.from(json['crew']);
    }
    if (json['ships'] != null) {
      ships = List<String>.from(json['ships']);
    }
    if (json['capsules'] != null) {
      capsules = List<String>.from(json['capsules']);
    }
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = <Cores>[];
      json['cores'].forEach((v) {
        cores!.add(Cores.fromJson(v));
      });
    }
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    launchLibraryId = json['launch_library_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fairings != null) {
      data['fairings'] = fairings!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['static_fire_date_utc'] = staticFireDateUtc;
    data['static_fire_date_unix'] = staticFireDateUnix;
    data['net'] = net;
    data['window'] = window;
    data['rocket'] = rocket;
    data['success'] = success;
    if (failures != null) {
      data['failures'] = failures!.map((v) => v.toJson()).toList();
    }
    data['details'] = details;
    data['crew'] = crew;
    data['ships'] = ships;
    data['capsules'] = capsules;
    data['payloads'] = payloads;
    data['launchpad'] = launchpad;
    data['flight_number'] = flightNumber;
    data['name'] = name;
    data['date_utc'] = dateUtc;
    data['date_unix'] = dateUnix;
    data['date_local'] = dateLocal;
    data['date_precision'] = datePrecision;
    data['upcoming'] = upcoming;
    if (cores != null) {
      data['cores'] = cores!.map((v) => v.toJson()).toList();
    }
    data['auto_update'] = autoUpdate;
    data['tbd'] = tbd;
    data['launch_library_id'] = launchLibraryId;
    data['id'] = id;
    return data;
  }
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<String>? ships;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ships});

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    if (json['ships'] != null) {
      ships = List<String>.from(json['ships']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reused'] = reused;
    data['recovery_attempt'] = recoveryAttempt;
    data['recovered'] = recovered;
    data['ships'] = ships;
    return data;
  }
}

class Links {
  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  Null presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links(
      {this.patch,
      this.reddit,
      this.flickr,
      this.presskit,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;
    reddit = json['reddit'] != null ? Reddit.fromJson(json['reddit']) : null;
    flickr = json['flickr'] != null ? Flickr.fromJson(json['flickr']) : null;
    presskit = json['presskit'];
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (patch != null) {
      data['patch'] = patch!.toJson();
    }
    if (reddit != null) {
      data['reddit'] = reddit!.toJson();
    }
    if (flickr != null) {
      data['flickr'] = flickr!.toJson();
    }
    data['presskit'] = presskit;
    data['webcast'] = webcast;
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

class Reddit {
  Null campaign;
  Null launch;
  Null media;
  Null recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  Reddit.fromJson(Map<String, dynamic> json) {
    campaign = json['campaign'];
    launch = json['launch'];
    media = json['media'];
    recovery = json['recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['campaign'] = campaign;
    data['launch'] = launch;
    data['media'] = media;
    data['recovery'] = recovery;
    return data;
  }
}

class Flickr {
  List<String>? small;
  List<String>? original;

  Flickr({this.small, this.original});

  Flickr.fromJson(Map<String, dynamic> json) {
    if (json['small'] != null) {
      small = List<String>.from(json['small']);
    }
    if (json['original'] != null) {
      original = List<String>.from(json['original']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small;
    }
    if (original != null) {
      data['original'] = original;
    }
    return data;
  }
}

class Failures {
  int? time;
  Null altitude;
  String? reason;

  Failures({this.time, this.altitude, this.reason});

  Failures.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    altitude = json['altitude'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['altitude'] = altitude;
    data['reason'] = reason;
    return data;
  }
}

class Cores {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  Null landingSuccess;
  Null landingType;
  Null landpad;

  Cores(
      {this.core,
      this.flight,
      this.gridfins,
      this.legs,
      this.reused,
      this.landingAttempt,
      this.landingSuccess,
      this.landingType,
      this.landpad});

  Cores.fromJson(Map<String, dynamic> json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = json['landing_success'];
    landingType = json['landing_type'];
    landpad = json['landpad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['core'] = core;
    data['flight'] = flight;
    data['gridfins'] = gridfins;
    data['legs'] = legs;
    data['reused'] = reused;
    data['landing_attempt'] = landingAttempt;
    data['landing_success'] = landingSuccess;
    data['landing_type'] = landingType;
    data['landpad'] = landpad;
    return data;
  }
}
