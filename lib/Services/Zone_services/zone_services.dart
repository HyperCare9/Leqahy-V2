import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Model/Zone_model/zone_model.dart';
import '../../Repository/Zone_Repository/zone_repository.dart';

import '../../Constant/string.dart';

class ZoneAPI extends ZoneRepository {
  @override
  Future<List<ZoneModel>> getAllZones({String? countryID}) async {
    List<ZoneModel> zoneModel = [];
    String url = 'get-main-oc_egypt_zones';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"country_id": countryID});

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Zones']);
        zoneModel = decoded.map((e) => ZoneModel.fromJson(e)).toList();
        return zoneModel;
      }
    } catch (e) {
      print(e);
    }
    return zoneModel;
  }
}
