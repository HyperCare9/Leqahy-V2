import 'dart:convert';

import '../../Constant/string.dart';
import '../../Model/Product_model/product_company_model.dart';
import '../../Model/Product_model/product_details_Model.dart';
import '../../Model/Product_model/product_images_model.dart';
import '../../Model/Product_model/product_description_model.dart';
import '../../Model/Product_model/product_mainImage.dart';
import '../../Model/Product_model/product_model.dart';
import '../../Model/Product_model/product_sub_images.dart';
import '../../Model/Product_model/product_view.dart';
import '../../Repository/Product_Repository/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductAPI extends ProductRepository {
  @override
  Future<List<ProductCompanyModel>> getAllCompanies(
      {String? classID, String? languageID}) async {
    List<ProductCompanyModel> companyModel = [];
    String url = 'get-Companies-Info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"class_id": classID, "language_id": languageID});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Companies']);
        companyModel =
            decodedData.map((e) => ProductCompanyModel.fromJson(e)).toList();
        return companyModel;
      }
    } catch (e) {
      print(e);
    }
    return companyModel;
  }

  @override
  Future<List<ProductModel>> getAllProduct(
      {String? companyID, String? languageID}) async {
    List<ProductModel> productModel = [];
    String url = 'get-AllProducts-Info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "company_id": companyID,
      "language_id": languageID,
      "customer_id": CustomerData().cusID.toString()
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Products']);
        productModel =
            decodedData.map((e) => ProductModel.fromJson(e)).toList();
        return productModel;
      }
    } catch (e) {
      print(e);
    }
    return productModel;
  }

  @override
  Future<List<PrdouctDescriptionModel>> getProductDescription(
      {String? productId, String? languageId}) async {
    List<PrdouctDescriptionModel> productDescriptionModel = [];
    String url = 'get-AllProducts-Info_details2';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"product_id": productId, "language_id": languageId});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Product Description']);
        productDescriptionModel = decodedData
            .map((e) => PrdouctDescriptionModel.fromJson(e))
            .toList();
        return productDescriptionModel;
      }
    } catch (e) {
      print(e);
    }
    return productDescriptionModel;
  }

  @override
  Future<List<ProductImagesModel>> getProductImages({String? productId}) async {
    List<ProductImagesModel> productImagesModel = [];
    String url = 'get-AllProducts-Info_details4';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"product_id": productId});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Product Images']);
        productImagesModel =
            decodedData.map((e) => ProductImagesModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return productImagesModel;
  }

  @override
  Future<ProductViewModel> updateProductView(
      {String? customerID, String? productID}) async {
    ProductViewModel productView = ProductViewModel();
    String url = 'add-productView_info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"customer_id": customerID, "product_id": productID});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        productView = ProductViewModel.fromJson(data);
        return productView;
      }
    } catch (e) {
      print(e);
    }
    return productView;
  }

  @override
  Future<List<ProductDetailsModel>> getProductDetails(
      {String? productId, String? languageId, String? customerID}) async {
    List<ProductDetailsModel> productDetailsModel = [];
    String url = 'get-productDescription_info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "product_id": productId,
      "language_id": languageId,
      "customer_id": customerID
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Product Details']);
        productDetailsModel =
            decodedData.map((e) => ProductDetailsModel.fromJson(e)).toList();
        return productDetailsModel;
      }
    } catch (e) {
      print(e);
    }
    return productDetailsModel;
  }

  @override
  Future<List<ProductMainImageModel>> getMainProductImages(
      {String? productId}) async {
    List<ProductMainImageModel> productMainImagesModel = [];
    String url = 'get-AllProducts-Info_details4';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"product_id": productId});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Product Main Image']);
        productMainImagesModel =
            decodedData.map((e) => ProductMainImageModel.fromJson(e)).toList();
        return productMainImagesModel;
      }
    } catch (e) {
      print(e);
    }
    return productMainImagesModel;
  }

  @override
  Future<List<ProductSubImagesModel>> getSubProductImages(
      {String? productId}) async {
    List<ProductSubImagesModel> productSubImagesModel = [];
    String url = 'get-AllProducts-Info_details4';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"product_id": productId});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(data['Product Sub Images']);
        productSubImagesModel =
            decodedData.map((e) => ProductSubImagesModel.fromJson(e)).toList();
        return productSubImagesModel;
      }
    } catch (e) {
      print(e);
    }
    return productSubImagesModel;
  }
}
