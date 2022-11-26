class ProductMainImageModel {
  String? productId;
  String? productImage;

  ProductMainImageModel({this.productId, this.productImage});

  factory ProductMainImageModel.fromJson(Map<String, dynamic> json) {
    ProductMainImageModel productMainImageModel = ProductMainImageModel();
    productMainImageModel.productId = json['product_id'];
    productMainImageModel.productImage = json['Main_Image'];
    return productMainImageModel;
  }
}
