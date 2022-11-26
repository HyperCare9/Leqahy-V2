// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? productId;
  String? model;
  String? sku;
  String? upc;
  String? ean;
  String? jan;
  String? isbn;
  String? mpn;
  String? quantity;
  String? image;
  String? manufacturerId;
  String? shipping;
  String? price;
  String? points;
  String? taxClassId;
  String? dateAvailable;
  String? weight;
  String? weightClassId;
  String? length;
  String? width;
  String? height;
  String? lengthClassId;
  String? subtract;
  String? minimum;
  String? sortOrder;
  String? status;
  String? viewed;
  String? dateAdded;
  String? dateModified;
  String? productChecks;
  String? name;
  String? languageID;
  String? cartQuantity;

  ProductModel(
      {this.productId,
      this.model,
      this.sku,
      this.upc,
      this.ean,
      this.jan,
      this.isbn,
      this.mpn,
      this.quantity,
      this.image,
      this.manufacturerId,
      this.shipping,
      this.price,
      this.points,
      this.taxClassId,
      this.dateAvailable,
      this.weight,
      this.weightClassId,
      this.length,
      this.width,
      this.height,
      this.lengthClassId,
      this.subtract,
      this.minimum,
      this.sortOrder,
      this.status,
      this.viewed,
      this.dateAdded,
      this.dateModified,
      this.productChecks,
      this.name,
      this.languageID,
      this.cartQuantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    ProductModel productModel = ProductModel();
    productModel.productId = json['product_id'];
    productModel.model = json['model'];
    productModel.sku = json['sku'];
    productModel.upc = json['upc'];
    productModel.ean = json['ean'];
    productModel.jan = json['jan'];
    productModel.isbn = json['isbn'];
    productModel.mpn = json['mpn'];
    productModel.quantity = json['Main Quantity'];
    productModel.image = json['image'];
    productModel.manufacturerId = json['manufacturer_id'];
    productModel.shipping = json['shipping'];
    productModel.price = json['price'];
    productModel.points = json['points'];
    productModel.taxClassId = json['tax_class_id'];
    productModel.dateAvailable = json['date_available'];
    productModel.weight = json['weight'];
    productModel.weightClassId = json['weight_class_id'];
    productModel.length = json['length'];
    productModel.width = json['width'];
    productModel.height = json['height'];
    productModel.lengthClassId = json['length_class_id'];
    productModel.subtract = json['subtract'];
    productModel.minimum = json['minimum'];
    productModel.sortOrder = json['sort_order'];
    productModel.status = json['status'];
    productModel.viewed = json['viewed'];
    productModel.dateAdded = json['date_added'];
    productModel.dateModified = json['date_modified'];
    productModel.productChecks = json['Product_Checks'];
    productModel.name = json['product_name'];
    productModel.languageID = json['language_id'];
    productModel.cartQuantity = json['Cart_quantity'];
    return productModel;
  }
}
