import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Model/menu_model/menu_header_model.dart';
import '../../Model/menu_model/menu_product_model.dart';
import '../../Repository/Menu_Repository/menu_repository.dart';

import '../../Constant/string.dart';

class MenuAPI extends MenuRepostiory {
  @override
  Future<List<MenuHeaderModel>> getMenuHeader(
      {String? languageID, String? categoryID, String? code}) async {
    String url = 'show-menu_items';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "language_id": languageID,
      "category_id": categoryID,
      "code": code,
    });
    List<MenuHeaderModel> menuHeaderModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Menu Items']);
        menuHeaderModel =
            decoded.map((e) => MenuHeaderModel.fromJson(e)).toList();
        return menuHeaderModel;
      }
    } catch (e) {
      print(e);
    }
    return menuHeaderModel;
  }

  @override
  Future<List<MenuHeaderModel>> getMainMenu({String? languageID}) async {
    String url = 'show-main-menu_items';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "language_id": languageID,
    });
    List<MenuHeaderModel> menuHeaderModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Menu Items']);
        menuHeaderModel =
            decoded.map((e) => MenuHeaderModel.fromJson(e)).toList();
        return menuHeaderModel;
      }
    } catch (e) {
      print(e);
    }
    return menuHeaderModel;
  }

  @override
  Future<List<MenuProductModel>> getProductByCategory(
      {String? customerID, String? categoryID, String? languageID}) async {
    String url = 'show-filterCategoriesProducts';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": customerID,
      "category_id": categoryID,
      "language_id": languageID
    });
    List<MenuProductModel> menuProductModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Results']);
        menuProductModel =
            decoded.map((e) => MenuProductModel.fromJson(e)).toList();
        return menuProductModel;
      }
    } catch (e) {
      print(e);
    }
    return menuProductModel;
  }
}
