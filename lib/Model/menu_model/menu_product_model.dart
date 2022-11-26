class MenuProductModel {
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

  MenuProductModel(
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

  factory MenuProductModel.fromJson(Map<String, dynamic> json) {
    MenuProductModel menuProductModel = MenuProductModel();
    menuProductModel.productId = json['product_id'];
    menuProductModel.model = json['model'];
    menuProductModel.sku = json['sku'];
    menuProductModel.upc = json['upc'];
    menuProductModel.ean = json['ean'];
    menuProductModel.jan = json['jan'];
    menuProductModel.isbn = json['isbn'];
    menuProductModel.mpn = json['mpn'];
    menuProductModel.quantity = json['Main Quantity'];
    menuProductModel.image = json['image'];
    menuProductModel.manufacturerId = json['manufacturer_id'];
    menuProductModel.shipping = json['shipping'];
    menuProductModel.price = json['price'];
    menuProductModel.points = json['points'];
    menuProductModel.taxClassId = json['tax_class_id'];
    menuProductModel.dateAvailable = json['date_available'];
    menuProductModel.weight = json['weight'];
    menuProductModel.weightClassId = json['weight_class_id'];
    menuProductModel.length = json['length'];
    menuProductModel.width = json['width'];
    menuProductModel.height = json['height'];
    menuProductModel.lengthClassId = json['length_class_id'];
    menuProductModel.subtract = json['subtract'];
    menuProductModel.minimum = json['minimum'];
    menuProductModel.sortOrder = json['sort_order'];
    menuProductModel.status = json['status'];
    menuProductModel.viewed = json['viewed'];
    menuProductModel.dateAdded = json['date_added'];
    menuProductModel.dateModified = json['date_modified'];
    menuProductModel.productChecks = json['Product_Checks'];
    menuProductModel.name = json['product_name'];
    menuProductModel.languageID = json['language_id'];
    menuProductModel.cartQuantity = json['Cart_quantity'];
    return menuProductModel;
  }
}
