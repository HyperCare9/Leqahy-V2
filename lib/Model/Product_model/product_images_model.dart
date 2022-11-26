class ProductImagesModel {
  String? productImageId;
  String? productId;
  String? sortOrder;
  String? image;

  ProductImagesModel({
    this.productImageId,
    this.productId,
    this.sortOrder,
    this.image,
  });

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) {
    ProductImagesModel productImagesModel = ProductImagesModel();
    productImagesModel.productImageId = json['Product_Image_Id'];
    productImagesModel.productId = json['Product_Id'];
    productImagesModel.sortOrder = json['Sort_Order'];
    productImagesModel.image = json['Image'];
    return productImagesModel;
  }
}
