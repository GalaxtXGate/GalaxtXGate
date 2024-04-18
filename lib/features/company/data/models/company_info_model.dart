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
        ? new Headquarters.fromJson(json['headquarters'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headquarters != null) {
      data['headquarters'] = this.headquarters!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['name'] = this.name;
    data['founder'] = this.founder;
    data['founded'] = this.founded;
    data['employees'] = this.employees;
    data['vehicles'] = this.vehicles;
    data['launch_sites'] = this.launchSites;
    data['test_sites'] = this.testSites;
    data['ceo'] = this.ceo;
    data['cto'] = this.cto;
    data['coo'] = this.coo;
    data['cto_propulsion'] = this.ctoPropulsion;
    data['valuation'] = this.valuation;
    data['summary'] = this.summary;
    data['id'] = this.id;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['website'] = this.website;
    data['flickr'] = this.flickr;
    data['twitter'] = this.twitter;
    data['elon_twitter'] = this.elonTwitter;
    return data;
  }
}
