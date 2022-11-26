import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leqahy_v2/Model/login_model/delete_user_model.dart';
import '../../Constant/cachHelper.dart';
import '../../Constant/string.dart';
import '../../Model/login_model/login_model.dart';
import '../../Model/login_model/register_model.dart';
import '../../Repository/Login_Repository/login_repository.dart';

class LoginAPI extends LoginRepository {
  @override
  Future<LoginModel> userLogin({String? email, String? password}) async {
    LoginModel loginModel = LoginModel();
    String url = 'user/login';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"email": email, "password": password});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        loginModel = LoginModel.fromJson(data);
        CachHelper.saveData(key: 'cusID', value: loginModel.userModel!.id);
        CachHelper.saveData(
            key: 'cusGroupID', value: loginModel.userModel!.customerGroupId);
        CachHelper.saveData(
            key: 'cusFirstName', value: loginModel.userModel!.firstname);
        CachHelper.saveData(
            key: 'cusLastName', value: loginModel.userModel!.lastname);
        CachHelper.saveData(
            key: 'cusEmail', value: loginModel.userModel!.email);
        CachHelper.saveData(
            key: 'cusTele', value: loginModel.userModel!.telephone);
        return loginModel;
      }
    } catch (e) {
      print(e.runtimeType);
    }
    return loginModel;
  }

  @override
  Future<RegisterModel> userRegister({
    String? firstName,
    String? lastName,
    String? customerGroupID,
    String? email,
    String? phone,
    String? password,
    String? address,
    String? languageID,
    String? ip,
    String? code,
    String? latuide,
    String? longtuide,
    String? zoneID,
    String? countryID,
    String? city,
    String? postalCode,
  }) async {
    RegisterModel registerModel = RegisterModel();
    String url = 'user/register';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "firstname": firstName,
      "email": email,
      "password": password,
      "lastname": lastName,
      "address_1": address ??=
          '1600 Amphitheatre Pkwy,Mountain View,United States',
      "customer_group_id": customerGroupID ??= '2',
      "ip": ip ??= CustomerData().ipAddress,
      "language_id": languageID ??= "2",
      "telephone": phone,
      "code": code ??= "9ryewur3243iere",
      "width_line": AddressData().latitude ??= "29.97274206199496",
      "height_line": AddressData().longitude ??= "30.944025113440144",
      "zone_id": zoneID ??= "1008",
      "country_id": "63",
      "city": city ??= '6 October',
      "postalcode": postalCode ??= '505321',
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        registerModel = RegisterModel.fromJson(data);
        return registerModel;
      }
    } catch (e) {
      print(e);
    }
    return registerModel;
  }

  @override
  Future<DeleteUserModel> deleteAccount(
      {String? email, String? password}) async {
    DeleteUserModel deleteUserModel = DeleteUserModel();
    String url = 'delete-customer-account';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"email": email, "password": password});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        deleteUserModel = DeleteUserModel.fromJson(data);
        return deleteUserModel;
      }
    } catch (e) {
      print(e.runtimeType);
    }
    return deleteUserModel;
  }
}
