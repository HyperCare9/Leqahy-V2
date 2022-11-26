// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderProductModel {
  String? orderId;
  String? productId;
  String? quantity;
  String? total;
  String? image;
  String? name;
  String? statusName;

  OrderProductModel({
    this.orderId,
    this.productId,
    this.quantity,
    this.total,
    this.image,
    this.name,
    this.statusName,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    OrderProductModel orderProductModel = OrderProductModel();
    orderProductModel.orderId = json['order_id'];
    orderProductModel.productId = json['product_id'];
    orderProductModel.quantity = json['quantity'];
    orderProductModel.total = json['total'];
    orderProductModel.image = json['image'];
    orderProductModel.name = json['name'];
    orderProductModel.statusName = json['status_name'];
    return orderProductModel;
  }
}
