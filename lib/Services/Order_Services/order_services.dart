import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Model/Order_model/cancel_order_model.dart';
import '../../Model/Order_model/cancel_product_order.dart';
import '../../Model/Order_model/confirm_order_model.dart';
import '../../Model/Order_model/order_details_model.dart';
import '../../Model/Order_model/order_product_model.dart';
import '../../Repository/Order_Repository/order_repository.dart';

import '../../Constant/string.dart';

class OrderAPI extends OrderRepository {
  @override
  Future<ConfirmOrderModel> confirmOrder({
    String? paymentFirstname,
    String? paymentLastname,
    String? paymentCompany,
    String? paymentAddress1,
    String? paymentAddress2,
    String? paymentCity,
    String? paymentPostcode,
    String? paymentCountry,
    String? paymentCountryID,
    String? paymentZone,
    String? paymentZoneID,
    String? paymentMethod,
    String? shippingFirstname,
    String? shippingLastname,
    String? shippingCompany,
    String? shippingAddress1,
    String? shippingAddress2,
    String? shippingCity,
    String? shippingPostcode,
    String? shippingCountry,
    String? shippingCountryID,
    String? shippingZone,
    String? shippingZoneId,
    String? shippingMethod,
    String? languageId,
    String? ip,
  }) async {
    ConfirmOrderModel confirmOrderModel = ConfirmOrderModel();
    String url = 'add-order-details';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": CustomerData().cusID,
      "customer_group_id": CustomerData().cusGroupID,
      "firstname": CustomerData().cusFirstName,
      "lastname": CustomerData().cusLastName,
      "email": CustomerData().cusEmail,
      "telephone": CustomerData().cusTele,
      "payment_firstname": paymentFirstname ??= CustomerData().cusFirstName,
      "payment_lastname": paymentLastname ??= CustomerData().cusLastName,
      "payment_company": paymentCompany ??= 'HyperCare',
      "payment_address_1": paymentAddress1 ??= 'villa 89',
      "payment_address_2": paymentAddress2 ??= 'Elsheik Zayed',
      "payment_city": paymentCity ??= '6 October',
      "payment_postcode": paymentPostcode ??= '324653',
      "payment_country": "Egypt",
      "payment_country_id": "02",
      "payment_zone": paymentZone ??= 'Al Jizah',
      "payment_zone_id": paymentZoneID ??= '1008',
      "payment_method": paymentMethod ??= 'Cach on Delivery',
      "shipping_firstname": shippingFirstname ??= CustomerData().cusFirstName,
      "shipping_lastname": shippingLastname ??= CustomerData().cusLastName,
      "shipping_company": shippingCompany ??= 'HyperCare',
      "shipping_address_1": shippingAddress1 ??= 'villa 89',
      "shipping_address_2": shippingAddress2 ??= 'Elsheik Zayed',
      "shipping_city": shippingCity ??= '6 October',
      "shipping_postcode": shippingPostcode ??= '324653',
      "shipping_country": "Egypt",
      "shipping_country_id": "02",
      "shipping_zone": shippingZone ??= 'Al Jizah',
      "shipping_zone_id": shippingZoneId ??= '1008',
      "shipping_method": shippingMethod ??= 'Cach on Delivery',
      "language_id": languageId,
      "ip": ip
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        confirmOrderModel = ConfirmOrderModel.fromJson(data);
        return confirmOrderModel;
      }
    } catch (e) {
      print(e);
    }
    return confirmOrderModel;
  }

  @override
  Future<List<OrderProductModel>> getPrdouctOrder(
      {String? orderID, String? languageID}) async {
    String url = 'get-order-products-details';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": "${CustomerData().cusID}",
      "language_id": languageID,
      "order_id": orderID,
    });
    List<OrderProductModel> orderProductModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Orders Products Details']);
        orderProductModel =
            decoded.map((e) => OrderProductModel.fromJson(e)).toList();
        return orderProductModel;
      }
    } catch (e) {
      print(e);
    }
    return orderProductModel;
  }

  @override
  Future<List<OrderDetailsModel>> getOrderDetails(
      {String? customerID, String? orderID, String? languageID}) async {
    String url = 'get-order-details';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": customerID,
      "order_id": orderID,
      "language_id": languageID
    });
    List<OrderDetailsModel> orderDetailsModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Orders Details']);
        orderDetailsModel =
            decoded.map((e) => OrderDetailsModel.fromJson(e)).toList();
        return orderDetailsModel;
      }
    } catch (e) {
      print(e);
    }
    return orderDetailsModel;
  }

  @override
  Future<OrderCancelationModel> cancelOrder(
      {String? customerID, String? orderID}) async {
    String url = 'get-order-cancelation';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": customerID,
      "order_id": orderID,
    });
    OrderCancelationModel orderCancelationModel = OrderCancelationModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        orderCancelationModel = OrderCancelationModel.fromJson(data);
        return orderCancelationModel;
      }
    } catch (e) {
      print(e);
    }
    return orderCancelationModel;
  }

  @override
  Future<CancelProductOrderModel> cancelProductOrder(
      {String? customerID, String? orderID, String? productID}) async {
    String url = 'get-order-product-cancelation';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": customerID,
      "order_id": orderID,
      "product_id": productID
    });
    CancelProductOrderModel cancelProductOrderModel = CancelProductOrderModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        cancelProductOrderModel = CancelProductOrderModel.fromJson(data);
        return cancelProductOrderModel;
      }
    } catch (e) {
      print(e);
    }
    return cancelProductOrderModel;
  }
}
