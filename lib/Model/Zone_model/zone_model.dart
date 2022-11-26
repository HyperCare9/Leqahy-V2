// ignore_for_file: public_member_api_docs, sort_constructors_first
class ZoneModel {
  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;

  ZoneModel({
    this.zoneId,
    this.countryId,
    this.name,
    this.code,
    this.status,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    ZoneModel zoneModel = ZoneModel();
    zoneModel.zoneId = json['zone_id'];
    zoneModel.countryId = json['country_id'];
    zoneModel.name = json['name'];
    zoneModel.code = json['code'];
    zoneModel.status = json['status'];
    return zoneModel;
  }
}
