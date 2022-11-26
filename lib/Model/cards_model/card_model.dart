class CardModel {
  String? productId;
  String? customerId;
  String? model;
  String? quantity;
  String? mainQuantity;
  String? image;
  String? manufacturerId;
  String? shipping;
  String? price;
  String? points;
  String? taxClassId;
  String? dateAvailable;
  String? subtract;
  String? minimum;
  String? sortOrder;
  String? status;
  String? viewed;
  String? dateAdded;
  String? dateModified;
  String? productName;

  CardModel({
    this.productId,
    this.customerId,
    this.model,
    this.quantity,
    this.mainQuantity,
    this.image,
    this.manufacturerId,
    this.shipping,
    this.price,
    this.points,
    this.taxClassId,
    this.dateAvailable,
    this.subtract,
    this.minimum,
    this.sortOrder,
    this.status,
    this.viewed,
    this.dateAdded,
    this.dateModified,
    this.productName,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    CardModel cardModel = CardModel();
    cardModel.productId = json['product_id'];
    cardModel.customerId = json['customer_id'];
    cardModel.model = json['model'];
    cardModel.quantity = json['quantity'];
    cardModel.mainQuantity = json['Main_Quantity'];
    cardModel.image = json['image'];
    cardModel.manufacturerId = json['manufacturer_id'];
    cardModel.shipping = json['shipping'];
    cardModel.price = json['price'];
    cardModel.points = json['points'];
    cardModel.taxClassId = json['tax_class_id'];
    cardModel.dateAvailable = json['date_available'];
    cardModel.subtract = json['subtract'];
    cardModel.minimum = json['minimum'];
    cardModel.sortOrder = json['sort_order'];
    cardModel.status = json['status'];
    cardModel.viewed = json['viewed'];
    cardModel.dateAdded = json['date_added'];
    cardModel.dateModified = json['date_modified'];
    cardModel.productName = json['product_name'];
    return cardModel;
  }
}
