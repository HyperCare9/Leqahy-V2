import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constant/string.dart';
import '../../Model/banner_model/banner_model.dart';
import '../../Model/banner_model/banners_model.dart';
import '../../Repository/Banner_Repository/banner_repository.dart';

class BannerServices extends BannerRepository {
  @override
  Future<BannersModel> fetchBanners() async {
    BannersModel bannersModel = BannersModel();
    String url = 'get-main-oc_banners';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    try {
      var response =
          await http.get(Uri.parse('$baseURL$url'), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        bannersModel = BannersModel.fromJson(data);
        return bannersModel;
      }
    } catch (e) {
      print(e);
    }
    return bannersModel;
  }

  @override
  Future<List<BannnerModel>> getBanner() async {
    List<BannnerModel> banner = [];
    String url = 'get-main-oc_banners';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    try {
      var response =
          await http.get(Uri.parse('$baseURL$url'), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decode =
            List<Map<String, dynamic>>.from(data['Oc_banners']);
        banner = decode.map((e) => BannnerModel.fromJson(e)).toList();
        return banner;
      }
    } catch (e) {
      print(e);
    }
    return banner;
  }
}
