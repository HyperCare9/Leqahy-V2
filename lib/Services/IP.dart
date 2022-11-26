import 'package:http/http.dart' as http;
import '../Constant/cachHelper.dart';

class IpInfoAPI {
  static Future<String?> getIPADdress() async {
    try {
      var url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      CachHelper.saveData(key: 'IP', value: response.body);
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }
}
