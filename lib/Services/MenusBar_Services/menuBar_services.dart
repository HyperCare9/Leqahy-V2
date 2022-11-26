import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy_v2/Model/menus_model/sideMenu_model.dart';
import 'package:leqahy_v2/Model/menus_model/homeMenu_model.dart';
import 'package:leqahy_v2/Repository/menus_Repository/menusBar_repository.dart';

import '../../Constant/string.dart';

class MenusBarAPI extends MenusBarRepository {
  @override
  Future<List<HomeMenuModel>> getHomeMenu(
      {String? languageID, String? platformName}) async {
    String url = 'get-BigCategories-Info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "language_id": languageID,
      "platform_name": platformName,
    });
    List<HomeMenuModel> homeMenuModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Main Categories']);
        homeMenuModel = decoded.map((e) => HomeMenuModel.fromJson(e)).toList();
        return homeMenuModel;
      }
    } catch (e) {
      print(e);
    }
    return homeMenuModel;
  }

  @override
  Future<List<SideMenuModel>> getSideMenu(
      {String? languageID, String? platformName}) async {
    String url = 'show-side-menu_items';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "language_id": languageID,
      "platform_name": platformName,
    });
    List<SideMenuModel> sideMenuModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Side Menu Items']);
        sideMenuModel = decoded.map((e) => SideMenuModel.fromJson(e)).toList();
        return sideMenuModel;
      }
    } catch (e) {
      print(e);
    }
    return sideMenuModel;
  }
}
