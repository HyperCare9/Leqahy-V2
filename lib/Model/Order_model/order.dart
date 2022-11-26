// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  String? customerId;
  String? paymentMethod;
  int? paymentCode;
  String? shippingMethod;
  int? shippingCode;
  String? languageId;
  String? ip;
  String? orderStatusId;
  String? updatedAt;
  String? createdAt;
  int? orderId;

  OrderModel({
    this.customerId,
    this.paymentMethod,
    this.paymentCode,
    this.shippingMethod,
    this.shippingCode,
    this.languageId,
    this.ip,
    this.orderStatusId,
    this.updatedAt,
    this.createdAt,
    this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    OrderModel orderModel = OrderModel();
    orderModel.customerId = json['customer_id'];
    orderModel.paymentMethod = json['payment_method'];
    orderModel.paymentCode = json['payment_code'];
    orderModel.shippingMethod = json['shipping_method'];
    orderModel.shippingCode = json['shipping_code'];
    orderModel.languageId = json['language_id'];
    orderModel.ip = json['ip'];
    orderModel.orderStatusId = json['order_status_id'];
    orderModel.updatedAt = json['updated_at'];
    orderModel.createdAt = json['created_at'];
    orderModel.orderId = json['order_id'];
    return orderModel;
  }
}

//  "customer_id": "1",
//         "customer_group_id": "2",
//         "firstname": "Ahmed",
//         "lastname": "Salah",
//         "email": "ahmedsalah@gmail.com",
//         "telephone": "01095342162",
//         "payment_firstname": "Ali",
//         "payment_lastname": "Osama",
//         "payment_company": "Medivac",
//         "payment_address_1": "Egypt, Qena",
//         "payment_address_2": "Egypt, Assiut",
//         "payment_city": "qus",
//         "payment_postcode": "324653",
//         "payment_country": "Egypt",
//         "payment_country_id": "02",
//         "payment_zone": "Abo Hamad",
//         "payment_zone_id": "03",
//         "payment_custom_field": "457",
//         "payment_method": "cash on delivery",
//         "payment_code": 7824411078,  //***********
//         "shipping_firstname": "Osamna",
//         "shipping_lastname": "Khater",
//         "shipping_company": "Medivac 1",
//         "shipping_address_1": "USA, Calefornya",
//         "shipping_address_2": "England, Liverpool",
//         "shipping_city": "Liverpool",
//         "shipping_postcode": "543762",
//         "shipping_country": "USA",
//         "shipping_country_id": "065",
//         "shipping_zone": "13",
//         "shipping_zone_id": "12",
//         "shipping_method": "On delivery",
//         "shipping_code": 4017051137,  //***********
//         "language_id": "1",
//         "ip": "192.168.1.1",
//         "order_status_id": 2,
//         "updated_at": "2022-08-22T11:13:23.000000Z",
//         "created_at": "2022-08-22T11:13:23.000000Z",
//         "order_id": 36  //***********