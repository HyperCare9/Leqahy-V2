class OrderDetailsModel {
  String? customerId;
  int? orderId;
  String? customerGroupId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? paymentFirstname;
  String? paymentLastname;
  String? paymentCompany;
  String? paymentAddress1;
  String? paymentAddress2;
  String? paymentCity;
  String? paymentPostcode;
  String? paymentCountry;
  String? paymentCountryId;
  String? paymentZone;
  String? paymentZoneId;
  String? paymentMethod;
  String? paymentCode;
  String? shippingFirstname;
  String? shippingLastname;
  String? shippingCompany;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingPostcode;
  String? shippingCountry;
  String? shippingCountryId;
  String? shippingZone;
  String? shippingZoneId;
  String? shippingMethod;
  String? shippingCode;
  String? languageId;
  String? orderStatusId;
  String? ip;
  String? createdAt;
  String? total;
  String? statusName;

  OrderDetailsModel(
      {this.customerId,
      this.orderId,
      this.customerGroupId,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.paymentFirstname,
      this.paymentLastname,
      this.paymentCompany,
      this.paymentAddress1,
      this.paymentAddress2,
      this.paymentCity,
      this.paymentPostcode,
      this.paymentCountry,
      this.paymentCountryId,
      this.paymentZone,
      this.paymentZoneId,
      this.paymentMethod,
      this.paymentCode,
      this.shippingFirstname,
      this.shippingLastname,
      this.shippingCompany,
      this.shippingAddress1,
      this.shippingAddress2,
      this.shippingCity,
      this.shippingPostcode,
      this.shippingCountry,
      this.shippingCountryId,
      this.shippingZone,
      this.shippingZoneId,
      this.shippingMethod,
      this.shippingCode,
      this.languageId,
      this.orderStatusId,
      this.ip,
      this.createdAt,
      this.total,
      this.statusName});

  factory OrderDetailsModel.fromJson(Map<String?, dynamic> json) =>
      OrderDetailsModel(
          customerId: json["customer_id"],
          orderId: json["order_id"],
          customerGroupId: json["customer_group_id"],
          firstname: json["firstname"],
          lastname: json["lastname"],
          email: json["email"],
          telephone: json["telephone"],
          paymentFirstname: json["payment_firstname"],
          paymentLastname: json["payment_lastname"],
          paymentCompany: json["payment_company"],
          paymentAddress1: json["payment_address_1"],
          paymentAddress2: json["payment_address_2"],
          paymentCity: json["payment_city"],
          paymentPostcode: json["payment_postcode"],
          paymentCountry: json["payment_country"],
          paymentCountryId: json["payment_country_id"],
          paymentZone: json["payment_zone"],
          paymentZoneId: json["payment_zone_id"],
          paymentMethod: json["payment_method"],
          paymentCode: json["payment_code"],
          shippingFirstname: json["shipping_firstname"],
          shippingLastname: json["shipping_lastname"],
          shippingCompany: json["shipping_company"],
          shippingAddress1: json["shipping_address_1"],
          shippingAddress2: json["shipping_address_2"],
          shippingCity: json["shipping_city"],
          shippingPostcode: json["shipping_postcode"],
          shippingCountry: json["shipping_country"],
          shippingCountryId: json["shipping_country_id"],
          shippingZone: json["shipping_zone"],
          shippingZoneId: json["shipping_zone_id"],
          shippingMethod: json["shipping_method"],
          shippingCode: json["shipping_code"],
          languageId: json["language_id"],
          orderStatusId: json["order_status_id"],
          ip: json["ip"],
          createdAt: json["created_at"],
          total: json["total"],
          statusName: json['status_name']);
}
