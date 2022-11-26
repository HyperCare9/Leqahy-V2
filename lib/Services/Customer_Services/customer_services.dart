import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Constant/string.dart';
import '../../Model/Customer_model/customer_model.dart';
import '../../Model/Customer_model/groupCustomer_model.dart';
import '../../Model/Customer_model/updateCustomer_model.dart';
import '../../Repository/Customer_Repository/customer_repository.dart';

class CustomerAPI extends CustomerRepository {
  @override
  Future<List<CustomerModel>> getCustomerData({String? customerID}) async {
    String url = 'get-customer-data';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"customer_id": customerID, "language_id": "1"});
    List<CustomerModel> customerModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Customer Data']);
        customerModel = decoded.map((e) => CustomerModel.fromJson(e)).toList();
        return customerModel;
      }
    } catch (e) {
      print(e);
    }
    return customerModel;
  }

  @override
  Future<List<GroupCustomerModel>> getGroupCustomer(
      {String? languageID}) async {
    String url = 'get-main-oc_customer_groups';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"language_id": languageID});
    List<GroupCustomerModel> groupCustomerModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Oc_Customer_Groups']);
        groupCustomerModel =
            decoded.map((e) => GroupCustomerModel.fromJson(e)).toList();
        return groupCustomerModel;
      }
    } catch (e) {
      print(e);
    }
    return groupCustomerModel;
  }

  @override
  Future<UpdateCustomerModel> updateCustomer(
      {String? customerID,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? address,
      String? groupID,
      String? phone,
      String? zoneID,
      String? countryID,
      String? city,
      String? postal}) async {
    UpdateCustomerModel updateCustomerModel = UpdateCustomerModel();
    var url = 'get-customer-data-updateProfile';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": customerID,
      "firstname": firstName,
      "email": email,
      "password": password,
      "lastname": lastName,
      "address_1": address,
      "customer_group_id": groupID,
      "telephone": phone,
      "zone_id": zoneID,
      "country_id": countryID,
      "city": city,
      "postalcode": postal,
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        updateCustomerModel = UpdateCustomerModel.fromJson(data);

        return updateCustomerModel;
      }
    } catch (e) {
      print(e);
    }
    return updateCustomerModel;
  }
}
