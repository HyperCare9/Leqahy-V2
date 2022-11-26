import '../../Model/stockMarket_model/stockMarket_model.dart';

abstract class StockRepository {
  Future<List<StockMarketModel>> fetchStockData(
      {String? date, String? cateName});
}
