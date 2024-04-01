class Capsules {
  final int? reuseCount;
  final int? waterLandings;
  final int? landLandings;
  final String? lastUpdate;
  final List<String>? launches;
  final String? serial;
  final String? status;
  final String? type;
  final String? id;

  Capsules({
    this.reuseCount,
    this.waterLandings,
    this.landLandings,
    this.lastUpdate,
    this.launches,
    this.serial,
    this.status,
    this.type,
    this.id,
  });

  Capsules.fromJson(Map<String, dynamic> json)
      : reuseCount = json['reuse_count'] as int?,
        waterLandings = json['water_landings'] as int?,
        landLandings = json['land_landings'] as int?,
        lastUpdate = json['last_update'] as String?,
        launches = (json['launches'] as List?)?.map((dynamic e) => e as String).toList(),
        serial = json['serial'] as String?,
        status = json['status'] as String?,
        type = json['type'] as String?,
        id = json['id'] as String?;

  Map<String, dynamic> toJson() => {
    'reuse_count' : reuseCount,
    'water_landings' : waterLandings,
    'land_landings' : landLandings,
    'last_update' : lastUpdate,
    'launches' : launches,
    'serial' : serial,
    'status' : status,
    'type' : type,
    'id' : id
  };
}