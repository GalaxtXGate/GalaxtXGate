class CrewModel {
  String? name;
  String? agency;
  String? image;
  String? wikipedia;
  List<String>? launches;
  String? status;
  String? id;

  CrewModel(
      {this.name,
      this.agency,
      this.image,
      this.wikipedia,
      this.launches,
      this.status,
      this.id});

  CrewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    agency = json['agency'];
    image = json['image'];
    wikipedia = json['wikipedia'];
    launches = json['launches'].cast<String>();
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['agency'] = agency;
    data['image'] = image;
    data['wikipedia'] = wikipedia;
    data['launches'] = launches;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
