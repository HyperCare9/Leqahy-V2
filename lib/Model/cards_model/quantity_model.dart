// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuantityModel {
  String? mainQuantity;
  String? cartQuantity;

  QuantityModel({
    this.mainQuantity,
    this.cartQuantity,
  });

  factory QuantityModel.fromJson(Map<String, dynamic> json) {
    QuantityModel quantityModel = QuantityModel();
    quantityModel.mainQuantity = json['Main Quantity'];
    quantityModel.cartQuantity = json['Cart Quantity'];
    return quantityModel;
  }
}
