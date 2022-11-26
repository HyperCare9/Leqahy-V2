class AddToCardModel {
  String? customerId;
  String? productId;
  String? price;
  int? quantity;
  String? updatedAt;
  String? createdAt;
  int? cartId;

  AddToCardModel({
    this.customerId,
    this.productId,
    this.price,
    this.quantity,
    this.updatedAt,
    this.createdAt,
    this.cartId,
  });

  factory AddToCardModel.fromJson(Map<String, dynamic> json) {
    AddToCardModel addToCardModel = AddToCardModel();
    addToCardModel.customerId = json['customer_id'];
    addToCardModel.productId = json['product_id'];
    addToCardModel.price = json['price'];
    addToCardModel.quantity = json['quantity'];
    addToCardModel.updatedAt = json['updated_at'];
    addToCardModel.createdAt = json['created_at'];
    addToCardModel.cartId = json['cart_id'];
    return addToCardModel;
  }
}
