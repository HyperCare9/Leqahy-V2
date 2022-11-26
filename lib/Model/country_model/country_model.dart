// ignore_for_file: public_member_api_docs, sort_constructors_first
class CountryModel {
  String? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  String? postcodeRequired;
  String? status;
  String? zoneId;
  String? zoneName;
  String? zoneCode;
  String? zoneStatus;

  CountryModel({
    this.countryId,
    this.name,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.postcodeRequired,
    this.status,
    this.zoneId,
    this.zoneName,
    this.zoneCode,
    this.zoneStatus,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    CountryModel countryModel = CountryModel();
    countryModel.countryId = json['country_id'];
    countryModel.name = json['name'];
    countryModel.isoCode2 = json['iso_code_2'];
    countryModel.isoCode3 = json['iso_code_3'];
    countryModel.addressFormat = json['address_format'];
    countryModel.postcodeRequired = json['postcode_required'];
    countryModel.status = json['status'];
    countryModel.zoneId = json['zone_id'];
    countryModel.zoneName = json['zone_name'];
    countryModel.zoneCode = json['zone_code'];
    countryModel.zoneStatus = json['zone_status'];
    return countryModel;
  }
}
