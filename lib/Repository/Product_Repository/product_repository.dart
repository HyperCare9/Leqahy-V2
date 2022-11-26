import '../../Model/Product_model/product_company_model.dart';
import '../../Model/Product_model/product_description_model.dart';
import '../../Model/Product_model/product_details_Model.dart';
import '../../Model/Product_model/product_images_model.dart';
import '../../Model/Product_model/product_mainImage.dart';
import '../../Model/Product_model/product_model.dart';
import '../../Model/Product_model/product_sub_images.dart';

import '../../Model/Product_model/product_view.dart';

abstract class ProductRepository {
  Future<List<ProductCompanyModel>> getAllCompanies(
      {String? classID, String? languageID});
  Future<List<ProductModel>> getAllProduct(
      {String? companyID, String? languageID});
  Future<List<ProductImagesModel>> getProductImages({String? productId});
  Future<List<PrdouctDescriptionModel>> getProductDescription(
      {String? productId, String? languageId});
  Future<ProductViewModel> updateProductView(
      {String? customerID, String? productID});
  Future<List<ProductDetailsModel>> getProductDetails(
      {String? productId, String? languageId, String? customerID});
  Future<List<ProductMainImageModel>> getMainProductImages({String? productId});
  Future<List<ProductSubImagesModel>> getSubProductImages({String? productId});
}
