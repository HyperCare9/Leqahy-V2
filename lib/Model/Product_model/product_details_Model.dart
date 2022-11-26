class ProductDetailsModel {
  String? productId;
  String? model;
  String? sku;
  String? upc;
  String? ean;
  String? jan;
  String? isbn;
  String? mpn;
  String? mainQuantity;
  String? image;
  String? price;
  String? productChecks;
  String? productName;
  String? productDescription;
  String? cartQuantity;

  ProductDetailsModel({
    this.productId,
    this.model,
    this.sku,
    this.upc,
    this.ean,
    this.jan,
    this.isbn,
    this.mpn,
    this.mainQuantity,
    this.image,
    this.price,
    this.productChecks,
    this.productName,
    this.productDescription,
    this.cartQuantity,
  });

  factory ProductDetailsModel.fromJson(Map<String?, dynamic> json) {
    ProductDetailsModel productDetailsModel = ProductDetailsModel();
    productDetailsModel.productId = json["product_id"];
    productDetailsModel.model = json["model"];
    productDetailsModel.sku = json["sku"];
    productDetailsModel.upc = json["upc"];
    productDetailsModel.ean = json["ean"];
    productDetailsModel.jan = json["jan"];
    productDetailsModel.isbn = json["isbn"];
    productDetailsModel.mpn = json["mpn"];
    productDetailsModel.mainQuantity = json["Main Quantity"];
    productDetailsModel.image = json["image"];
    productDetailsModel.price = json["price"];
    productDetailsModel.productChecks = json["Product_Checks"];
    productDetailsModel.productName = json["product_name"];
    productDetailsModel.productDescription = json["product_description"];
    productDetailsModel.cartQuantity = json["Cart_quantity"];
    return productDetailsModel;
  }
}
