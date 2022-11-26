// ignore_for_file= public_member_api_docs, sort_constructors_first
class CustomerModel {
  int? customerId;
  String? customerGroupId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  String? salt;
  String? addressId;
  String? customField;
  String? ip;
  String? status;
  String? safe;
  String? code;
  String? token;
  String? widthLine;
  String? heightLine;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? countryName;
  String? isoCode2;
  String? isoCode3;
  String? zoneName;
  String? zoneCode;
  String? createdAt;
  String? customerGroupName;

  CustomerModel(
      {this.customerId,
      this.customerGroupId,
      this.languageId,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.fax,
      this.salt,
      this.addressId,
      this.customField,
      this.ip,
      this.status,
      this.safe,
      this.code,
      this.token,
      this.widthLine,
      this.heightLine,
      this.address1,
      this.address2,
      this.city,
      this.postcode,
      this.countryName,
      this.isoCode2,
      this.isoCode3,
      this.zoneName,
      this.zoneCode,
      this.createdAt,
      this.customerGroupName});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    CustomerModel customerModel = CustomerModel();
    customerModel.customerId = json["customer_id"];
    customerModel.customerGroupId = json["customer_group_id"];
    customerModel.languageId = json["language_id"];
    customerModel.firstname = json["firstname"];
    customerModel.lastname = json["lastname"];
    customerModel.email = json["email"];
    customerModel.telephone = json["telephone"];
    customerModel.fax = json["fax"];
    customerModel.salt = json["salt"];
    customerModel.addressId = json["address_id"];
    customerModel.customField = json["custom_field"];
    customerModel.ip = json["ip"];
    customerModel.status = json["status"];
    customerModel.safe = json["safe"];
    customerModel.code = json["code"];
    customerModel.token = json["token"];
    customerModel.widthLine = json["width_line"];
    customerModel.heightLine = json["height_line"];
    customerModel.address1 = json["address_1"];
    customerModel.address2 = json["address_2"];
    customerModel.city = json["city"];
    customerModel.postcode = json["postcode"];
    customerModel.countryName = json["country_name"];
    customerModel.isoCode2 = json["iso_code_2"];
    customerModel.isoCode3 = json["iso_code_3"];
    customerModel.zoneName = json["zone_name"];
    customerModel.zoneCode = json["zone_code"];
    customerModel.createdAt = json["created_at"];
    customerModel.customerGroupName = json['Customer_group_name'];
    return customerModel;
  }
}
