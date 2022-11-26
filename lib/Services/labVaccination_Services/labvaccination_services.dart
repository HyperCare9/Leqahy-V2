import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Constant/string.dart';
import '../../Repository/Vaccination_Repostiory/vaccination_repository.dart';

import '../../Model/labvaccine_model/vaccineProduct_model.dart';
import '../../Model/labvaccine_model/vaccine_model.dart';

class VaccinationAPI extends VaccinationRepository {
  @override
  Future<List<VaccineModel>> getVaccine({String? languageId}) async {
    String url = 'get-main-oc_vaccine_products';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"language_id": languageId});
    List<VaccineModel> vaccineModel = [];

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Product Vaccines']);
        vaccineModel = decoded.map((e) => VaccineModel.fromJson(e)).toList();
        return vaccineModel;
      }
    } catch (e) {
      print(e);
    }
    return vaccineModel;
  }

  @override
  Future<VaccineProductModel> sendVaccination(
      {String? cusName,
      String? cusNumber,
      String? labName,
      String? checkCount,
      String? date,
      String? reserveName,
      List<Map<String, dynamic>>? details}) async {
    VaccineProductModel vaccineProductModel = VaccineProductModel();
    String url = 'get-main-t_add_product';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_name": cusName,
      "customer_phone": cusNumber,
      "lab_name": labName,
      "check_count": checkCount,
      "labvac_date": date,
      "reserver_name": reserveName,
      "items": details
    });
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        vaccineProductModel = VaccineProductModel.fromJson(data);
        print(vaccineProductModel.productModel);
        return vaccineProductModel;
      }
    } catch (e) {
      print(e);
    }
    return vaccineProductModel;
  }
}
