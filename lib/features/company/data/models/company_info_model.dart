class CompanyInfoModel {
  Headquarters? headquarters;
  Links? links;
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  String? ctoPropulsion;
  int? valuation;
  String? summary;
  String? id;

  CompanyInfoModel(
      {this.headquarters,
      this.links,
      this.name,
      this.founder,
      this.founded,
      this.employees,
      this.vehicles,
      this.launchSites,
      this.testSites,
      this.ceo,
      this.cto,
      this.coo,
      this.ctoPropulsion,
      this.valuation,
      this.summary,
      this.id});

  CompanyInfoModel.fromJson(Map<String, dynamic> json) {
    headquarters = json['headquarters'] != null
        ? Headquarters.fromJson(json['headquarters'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    name = json['name'];
    founder = json['founder'];
    founded = json['founded'];
    employees = json['employees'];
    vehicles = json['vehicles'];
    launchSites = json['launch_sites'];
    testSites = json['test_sites'];
    ceo = json['ceo'];
    cto = json['cto'];
    coo = json['coo'];
    ctoPropulsion = json['cto_propulsion'];
    valuation = json['valuation'];
    summary = json['summary'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headquarters != null) {
      data['headquarters'] = headquarters!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['name'] = name;
    data['founder'] = founder;
    data['founded'] = founded;
    data['employees'] = employees;
    data['vehicles'] = vehicles;
    data['launch_sites'] = launchSites;
    data['test_sites'] = testSites;
    data['ceo'] = ceo;
    data['cto'] = cto;
    data['coo'] = coo;
    data['cto_propulsion'] = ctoPropulsion;
    data['valuation'] = valuation;
    data['summary'] = summary;
    data['id'] = id;
    return data;
  }
}

class Headquarters {
  String? address;
  String? city;
  String? state;

  Headquarters({this.address, this.city, this.state});

  Headquarters.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}

class Links {
  String? website;
  String? flickr;
  String? twitter;
  String? elonTwitter;

  Links({this.website, this.flickr, this.twitter, this.elonTwitter});

  Links.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    flickr = json['flickr'];
    twitter = json['twitter'];
    elonTwitter = json['elon_twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['website'] = website;
    data['flickr'] = flickr;
    data['twitter'] = twitter;
    data['elon_twitter'] = elonTwitter;
    return data;
  }
}
