import '../../Model/Order_model/cancel_order_model.dart';
import '../../Model/Order_model/cancel_product_order.dart';
import '../../Model/Order_model/confirm_order_model.dart';
import '../../Model/Order_model/order_details_model.dart';
import '../../Model/Order_model/order_product_model.dart';

abstract class OrderRepository {
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
  });
  Future<List<OrderProductModel>> getPrdouctOrder(
      {String? orderID, String? languageID});
  Future<List<OrderDetailsModel>> getOrderDetails(
      {String? customerID, String? orderID, String? languageID});
  Future<OrderCancelationModel> cancelOrder(
      {String? customerID, String? orderID});
  Future<CancelProductOrderModel> cancelProductOrder(
      {String? customerID, String? orderID, String? productID});
}
