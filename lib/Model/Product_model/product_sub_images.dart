// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductSubImagesModel {
  String? productImageId;
  String? productId;
  String? sortOrder;
  String? subImage;

  ProductSubImagesModel({
    this.productImageId,
    this.productId,
    this.sortOrder,
    this.subImage,
  });

  factory ProductSubImagesModel.fromJson(Map<String, dynamic> json) {
    ProductSubImagesModel productSubImagesModel = ProductSubImagesModel();
    productSubImagesModel.productImageId = json['product_image_id'];
    productSubImagesModel.productId = json['product_id'];
    productSubImagesModel.sortOrder = json['sort_order'];
    productSubImagesModel.subImage = json['Sub_Image'];
    return productSubImagesModel;
  }
}
