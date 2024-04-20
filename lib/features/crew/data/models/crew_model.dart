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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['agency'] = this.agency;
    data['image'] = this.image;
    data['wikipedia'] = this.wikipedia;
    data['launches'] = this.launches;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
