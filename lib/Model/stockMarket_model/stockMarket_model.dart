// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockMarketModel {
  String? stocmarketDate;
  String? stocmarketType;
  String? companyName;
  String? priceUnit;
  String? dynasty;
  String? price;
  String? borsaChecks;

  StockMarketModel(
      {this.stocmarketDate,
      this.stocmarketType,
      this.companyName,
      this.priceUnit,
      this.dynasty,
      this.price,
      this.borsaChecks});

  factory StockMarketModel.fromJson(Map<String, dynamic> json) {
    StockMarketModel stockMarketModel = StockMarketModel();
    stockMarketModel.stocmarketDate = json['stocmarket_date'];
    stockMarketModel.stocmarketType = json['stocmarket_type'];
    stockMarketModel.companyName = json['company_name'];
    stockMarketModel.priceUnit = json['price_unit'];
    stockMarketModel.dynasty = json['dynasty'];
    stockMarketModel.price = json['price'];
    stockMarketModel.borsaChecks = json['borsa_checks'];
    return stockMarketModel;
  }
}
