import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Constant/string.dart';
import '../../Model/stockMarket_model/stockMarket_model.dart';
import '../../Repository/Stock_Repository/stock_repository.dart';

class StockAPI extends StockRepository {
  @override
  Future<List<StockMarketModel>> fetchStockData(
      {String? date, String? cateName}) async {
    List<StockMarketModel> stockModel = [];
    String url = 'get-main-oc_stockmarket';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"category": cateName, "date_stock": date});

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Category']);
        stockModel = decoded.map((e) => StockMarketModel.fromJson(e)).toList();
        return stockModel;
      }
    } catch (e) {
      print(e);
    }
    return stockModel;
  }
}
