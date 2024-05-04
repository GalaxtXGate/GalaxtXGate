class CrewModel {
  late String name;
  late String agency;
  late String image;
  late String wikipedia;
  late List<String> launches;
  late String status;
  late String id;

  CrewModel(
      {required this.name,
      required this.agency,
      required this.image,
      required this.wikipedia,
      required this.launches,
      required this.status,
      required this.id});

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
