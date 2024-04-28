class RocketsModel {
  final Height? height;
  final Diameter? diameter;
  final Mass? mass;
  final FirstStage? firstStage;
  final SecondStage? secondStage;
  final Engines? engines;
  final LandingLegs? landingLegs;
  final List<PayloadWeights>? payloadWeights;
  final List<String>? flickrImages;
  final String? name;
  final String? type;
  final bool? active;
  final int? stages;
  final int? boosters;
  final int? costPerLaunch;
  final int? successRatePct;
  final String? firstFlight;
  final String? country;
  final String? company;
  final String? wikipedia;
  final String? description;
  final String? id;

  RocketsModel({
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
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
  });

  RocketsModel.fromJson(Map<String, dynamic> json)
      : height = (json['height'] as Map<String, dynamic>?) != null
            ? Height.fromJson(json['height'] as Map<String, dynamic>)
            : null,
        diameter = (json['diameter'] as Map<String, dynamic>?) != null
            ? Diameter.fromJson(json['diameter'] as Map<String, dynamic>)
            : null,
        mass = (json['mass'] as Map<String, dynamic>?) != null
            ? Mass.fromJson(json['mass'] as Map<String, dynamic>)
            : null,
        firstStage = (json['first_stage'] as Map<String, dynamic>?) != null
            ? FirstStage.fromJson(json['first_stage'] as Map<String, dynamic>)
            : null,
        secondStage = (json['second_stage'] as Map<String, dynamic>?) != null
            ? SecondStage.fromJson(json['second_stage'] as Map<String, dynamic>)
            : null,
        engines = (json['engines'] as Map<String, dynamic>?) != null
            ? Engines.fromJson(json['engines'] as Map<String, dynamic>)
            : null,
        landingLegs = (json['landing_legs'] as Map<String, dynamic>?) != null
            ? LandingLegs.fromJson(json['landing_legs'] as Map<String, dynamic>)
            : null,
        payloadWeights = (json['payload_weights'] as List?)
            ?.map((dynamic e) =>
                PayloadWeights.fromJson(e as Map<String, dynamic>))
            .toList(),
        flickrImages = (json['flickr_images'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        name = json['name'] as String?,
        type = json['type'] as String?,
        active = json['active'] as bool?,
        stages = json['stages'] as int?,
        boosters = json['boosters'] as int?,
        costPerLaunch = json['cost_per_launch'] as int?,
        successRatePct = json['success_rate_pct'] as int?,
        firstFlight = json['first_flight'] as String?,
        country = json['country'] as String?,
        company = json['company'] as String?,
        wikipedia = json['wikipedia'] as String?,
        description = json['description'] as String?,
        id = json['id'] as String?;

  Map<String, dynamic> toJson() => {
        'height': height?.toJson(),
        'diameter': diameter?.toJson(),
        'mass': mass?.toJson(),
        'first_stage': firstStage?.toJson(),
        'second_stage': secondStage?.toJson(),
        'engines': engines?.toJson(),
        'landing_legs': landingLegs?.toJson(),
        'payload_weights': payloadWeights?.map((e) => e.toJson()).toList(),
        'flickr_images': flickrImages,
        'name': name,
        'type': type,
        'active': active,
        'stages': stages,
        'boosters': boosters,
        'cost_per_launch': costPerLaunch,
        'success_rate_pct': successRatePct,
        'first_flight': firstFlight,
        'country': country,
        'company': company,
        'wikipedia': wikipedia,
        'description': description,
        'id': id
      };
}

class Mass {
  final int? kg;
  final int? lb;

  Mass({
    this.kg,
    this.lb,
  });

  Mass.fromJson(Map<String, dynamic> json)
      : kg = json['kg'] as int?,
        lb = json['lb'] as int?;

  Map<String, dynamic> toJson() => {'kg': kg, 'lb': lb};
}

class FirstStage {
  final ThrustSeaLevel? thrustSeaLevel;
  final ThrustVacuum? thrustVacuum;
  final bool? reusable;
  final int? engines;
  final double? fuelAmountTons;
  final int? burnTimeSec;

  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  FirstStage.fromJson(Map<String, dynamic> json)
      : thrustSeaLevel =
            (json['thrust_sea_level'] as Map<String, dynamic>?) != null
                ? ThrustSeaLevel.fromJson(
                    json['thrust_sea_level'] as Map<String, dynamic>)
                : null,
        thrustVacuum = (json['thrust_vacuum'] as Map<String, dynamic>?) != null
            ? ThrustVacuum.fromJson(
                json['thrust_vacuum'] as Map<String, dynamic>)
            : null,
        reusable = json['reusable'] as bool?,
        engines = json['engines'] as int?,
        fuelAmountTons = json['fuel_amount_tons'] as double?,
        burnTimeSec = json['burn_time_sec'] as int?;

  Map<String, dynamic> toJson() => {
        'thrust_sea_level': thrustSeaLevel?.toJson(),
        'thrust_vacuum': thrustVacuum?.toJson(),
        'reusable': reusable,
        'engines': engines,
        'fuel_amount_tons': fuelAmountTons,
        'burn_time_sec': burnTimeSec
      };
}

class ThrustSeaLevel {
  final int? kN;
  final int? lbf;

  ThrustSeaLevel({
    this.kN,
    this.lbf,
  });

  ThrustSeaLevel.fromJson(Map<String, dynamic> json)
      : kN = json['kN'] as int?,
        lbf = json['lbf'] as int?;

  Map<String, dynamic> toJson() => {'kN': kN, 'lbf': lbf};
}

class ThrustVacuum {
  final int? kN;
  final int? lbf;

  ThrustVacuum({
    this.kN,
    this.lbf,
  });

  ThrustVacuum.fromJson(Map<String, dynamic> json)
      : kN = json['kN'] as int?,
        lbf = json['lbf'] as int?;

  Map<String, dynamic> toJson() => {'kN': kN, 'lbf': lbf};
}

class SecondStage {
  final Thrust? thrust;
  final Payloads? payloads;
  final bool? reusable;
  final int? engines;
  final double? fuelAmountTons;
  final int? burnTimeSec;

  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  SecondStage.fromJson(Map<String, dynamic> json)
      : thrust = (json['thrust'] as Map<String, dynamic>?) != null
            ? Thrust.fromJson(json['thrust'] as Map<String, dynamic>)
            : null,
        payloads = (json['payloads'] as Map<String, dynamic>?) != null
            ? Payloads.fromJson(json['payloads'] as Map<String, dynamic>)
            : null,
        reusable = json['reusable'] as bool?,
        engines = json['engines'] as int?,
        fuelAmountTons = json['fuel_amount_tons'] as double?,
        burnTimeSec = json['burn_time_sec'] as int?;

  Map<String, dynamic> toJson() => {
        'thrust': thrust?.toJson(),
        'payloads': payloads?.toJson(),
        'reusable': reusable,
        'engines': engines,
        'fuel_amount_tons': fuelAmountTons,
        'burn_time_sec': burnTimeSec
      };
}

class Thrust {
  final int? kN;
  final int? lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust.fromJson(Map<String, dynamic> json)
      : kN = json['kN'] as int?,
        lbf = json['lbf'] as int?;

  Map<String, dynamic> toJson() => {'kN': kN, 'lbf': lbf};
}

class Payloads {
  final CompositeFairing? compositeFairing;
  final String? option1;

  Payloads({
    this.compositeFairing,
    this.option1,
  });

  Payloads.fromJson(Map<String, dynamic> json)
      : compositeFairing =
            (json['composite_fairing'] as Map<String, dynamic>?) != null
                ? CompositeFairing.fromJson(
                    json['composite_fairing'] as Map<String, dynamic>)
                : null,
        option1 = json['option_1'] as String?;

  Map<String, dynamic> toJson() =>
      {'composite_fairing': compositeFairing?.toJson(), 'option_1': option1};
}

class CompositeFairing {
  final Height? height;
  final Diameter? diameter;

  CompositeFairing({
    this.height,
    this.diameter,
  });

  CompositeFairing.fromJson(Map<String, dynamic> json)
      : height = (json['height'] as Map<String, dynamic>?) != null
            ? Height.fromJson(json['height'] as Map<String, dynamic>)
            : null,
        diameter = (json['diameter'] as Map<String, dynamic>?) != null
            ? Diameter.fromJson(json['diameter'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'height': height?.toJson(), 'diameter': diameter?.toJson()};
}

class Height {
  final double? meters;
  final double? feet;

  Height({
    this.meters,
    this.feet,
  });

  Height.fromJson(Map<String, dynamic> json)
      : meters = json['meters'] as double?,
        feet = json['feet'] as double?;

  Map<String, dynamic> toJson() => {'meters': meters, 'feet': feet};
}

class Diameter {
  final double? meters;
  final double? feet;

  Diameter({
    this.meters,
    this.feet,
  });

  Diameter.fromJson(Map<String, dynamic> json)
      : meters = json['meters'] as double?,
        feet = json['feet'] as double?;

  Map<String, dynamic> toJson() => {'meters': meters, 'feet': feet};
}

class Engines {
  final Isp? isp;
  final ThrustSeaLevel? thrustSeaLevel;
  final ThrustVacuum? thrustVacuum;
  final int? number;
  final String? type;
  final String? version;
  final String? layout;
  final int? engineLossMax;
  final String? propellant1;
  final String? propellant2;
  final int? thrustToWeight;

  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  Engines.fromJson(Map<String, dynamic> json)
      : isp = (json['isp'] as Map<String, dynamic>?) != null
            ? Isp.fromJson(json['isp'] as Map<String, dynamic>)
            : null,
        thrustSeaLevel =
            (json['thrust_sea_level'] as Map<String, dynamic>?) != null
                ? ThrustSeaLevel.fromJson(
                    json['thrust_sea_level'] as Map<String, dynamic>)
                : null,
        thrustVacuum = (json['thrust_vacuum'] as Map<String, dynamic>?) != null
            ? ThrustVacuum.fromJson(
                json['thrust_vacuum'] as Map<String, dynamic>)
            : null,
        number = json['number'] as int?,
        type = json['type'] as String?,
        version = json['version'] as String?,
        layout = json['layout'] as String?,
        engineLossMax = json['engine_loss_max'] as int?,
        propellant1 = json['propellant_1'] as String?,
        propellant2 = json['propellant_2'] as String?,
        thrustToWeight = json['thrust_to_weight'] as int?;

  Map<String, dynamic> toJson() => {
        'isp': isp?.toJson(),
        'thrust_sea_level': thrustSeaLevel?.toJson(),
        'thrust_vacuum': thrustVacuum?.toJson(),
        'number': number,
        'type': type,
        'version': version,
        'layout': layout,
        'engine_loss_max': engineLossMax,
        'propellant_1': propellant1,
        'propellant_2': propellant2,
        'thrust_to_weight': thrustToWeight
      };
}

class Isp {
  final int? seaLevel;
  final int? vacuum;

  Isp({
    this.seaLevel,
    this.vacuum,
  });

  Isp.fromJson(Map<String, dynamic> json)
      : seaLevel = json['sea_level'] as int?,
        vacuum = json['vacuum'] as int?;

  Map<String, dynamic> toJson() => {'sea_level': seaLevel, 'vacuum': vacuum};
}

class LandingLegs {
  final int? number;
  final dynamic material;

  LandingLegs({
    this.number,
    this.material,
  });

  LandingLegs.fromJson(Map<String, dynamic> json)
      : number = json['number'] as int?,
        material = json['material'];

  Map<String, dynamic> toJson() => {'number': number, 'material': material};
}

class PayloadWeights {
  final String? id;
  final String? name;
  final int? kg;
  final int? lb;

  PayloadWeights({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  PayloadWeights.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        kg = json['kg'] as int?,
        lb = json['lb'] as int?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'kg': kg, 'lb': lb};
}
