class RocketsModel {
  Engines? engines;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;
  bool? isExpanded;
  RocketsModel({
    this.engines,
    this.payloadWeights,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
    this.isExpanded = false,
  });

  RocketsModel.fromJson(Map<String, dynamic> json) {
    if (json['engines'] != null) {
      try {
        engines = Engines.fromJson(json['engines']);
      } catch (e) {
        engines = null;
      }
    } else {
      engines = null;
    }
    if (json['payload_weights'] != null) {
      payloadWeights = <PayloadWeights>[];
      json['payload_weights'].forEach((v) {
        payloadWeights!.add(PayloadWeights.fromJson(v));
      });
    }
    flickrImages = json['flickr_images'].cast<String>();
    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
    isExpanded = json['isExpanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (engines != null) {
      data['engines'] = engines!.toJson();
    }

    if (payloadWeights != null) {
      data['payload_weights'] = payloadWeights!.map((v) => v.toJson()).toList();
    }
    data['flickr_images'] = flickrImages;
    data['name'] = name;
    data['type'] = type;
    data['active'] = active;
    data['stages'] = stages;
    data['boosters'] = boosters;
    data['cost_per_launch'] = costPerLaunch;
    data['success_rate_pct'] = successRatePct;
    data['first_flight'] = firstFlight;
    data['country'] = country;
    data['company'] = company;
    data['wikipedia'] = wikipedia;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}

class Height {
  double? meters;
  int? feet;

  Height({this.meters, this.feet});

  Height.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['meters'] = meters;
    data['feet'] = feet;
    return data;
  }
}

class Diameter {
  double? meters;
  double? feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['meters'] = meters;
    data['feet'] = feet;
    return data;
  }
}

class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'];
    lb = json['lb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kg'] = kg;
    data['lb'] = lb;
    return data;
  }
}

class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
      this.thrustVacuum,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  FirstStage.fromJson(Map<String, dynamic> json) {
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (thrustSeaLevel != null) {
      data['thrust_sea_level'] = thrustSeaLevel!.toJson();
    }
    if (thrustVacuum != null) {
      data['thrust_vacuum'] = thrustVacuum!.toJson();
    }
    data['reusable'] = reusable;
    data['engines'] = engines;
    data['fuel_amount_tons'] = fuelAmountTons;
    data['burn_time_sec'] = burnTimeSec;
    return data;
  }
}

class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  ThrustSeaLevel.fromJson(Map<String, dynamic> json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['kN'] = kN;
    data['lbf'] = lbf;
    return data;
  }
}

class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  int? thrustToWeight;

  Engines(
      {this.isp,
      this.thrustSeaLevel,
      this.thrustVacuum,
      this.number,
      this.type,
      this.version,
      this.layout,
      this.engineLossMax,
      this.propellant1,
      this.propellant2,
      this.thrustToWeight});

  Engines.fromJson(Map<String, dynamic> json) {
    isp = json['isp'] != null ? Isp.fromJson(json['isp']) : null;
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    number = json['number'];
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'];
    propellant1 = json['propellant_1'];
    propellant2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (isp != null) {
      data['isp'] = isp!.toJson();
    }
    if (thrustSeaLevel != null) {
      data['thrust_sea_level'] = thrustSeaLevel!.toJson();
    }
    if (thrustVacuum != null) {
      data['thrust_vacuum'] = thrustVacuum!.toJson();
    }
    data['number'] = number;
    data['type'] = type;
    data['version'] = version;
    data['layout'] = layout;
    data['engine_loss_max'] = engineLossMax;
    data['propellant_1'] = propellant1;
    data['propellant_2'] = propellant2;
    data['thrust_to_weight'] = thrustToWeight;
    return data;
  }
}

class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({this.seaLevel, this.vacuum});

  Isp.fromJson(Map<String, dynamic> json) {
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sea_level'] = seaLevel;
    data['vacuum'] = vacuum;
    return data;
  }
}

class PayloadWeights {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeights({this.id, this.name, this.kg, this.lb});

  PayloadWeights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kg = json['kg'];
    lb = json['lb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['kg'] = kg;
    data['lb'] = lb;
    return data;
  }
}
