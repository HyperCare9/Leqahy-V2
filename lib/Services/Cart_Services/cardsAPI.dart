import 'dart:convert';
import '../../Model/cards_model/add_card_model.dart';
import '../../Model/cards_model/card_model.dart';
import '../../Model/cards_model/add_to_card_model.dart';
import '../../Model/cards_model/quantity_model.dart';
import '../../Model/cards_model/remove_item_model.dart';
import '../../Model/cards_model/remove_card_model.dart';
import '../../Model/cards_model/total_card.dart';
import '../../Model/cards_model/update_quantity_model.dart';
import '../../Repository/Card_Repository/card_repository.dart';
import 'package:http/http.dart' as http;
import '../../Constant/string.dart';

List<CardModel> customCardModel = [];

class CardAPI extends CardRepository {
  @override
  Future<AddToCardModel> addProductToCard({String? productID}) async {
    String url = 'add-onCart-Info';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode(
        {"customer_id": CustomerData().cusID, "product_id": productID});
    AddToCardModel addToCardModel = AddToCardModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        addToCardModel = AddToCardModel.fromJson(data['Your Cart']);
        return addToCardModel;
      }
    } catch (e) {
      print(e);
    }
    return addToCardModel;
  }

  @override
  Future<List<CardModel>> getCard({String? languageID}) async {
    String url = 'get-yourCart-Info';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": CustomerData().cusID,
      "language_id": languageID,
    });

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Your Cart']);
        customCardModel = decoded.map((e) => CardModel.fromJson(e)).toList();
        return customCardModel;
      }
    } catch (e) {
      print(e);
    }
    return customCardModel;
  }

  @override
  Future<AddCard> addCard({String? productID}) async {
    String url = 'add-onCart-Info';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode(
        {"customer_id": CustomerData().cusID, "product_id": productID});
    AddCard addToCardModel = AddCard();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        addToCardModel = AddCard.fromJson(data);
        return addToCardModel;
      }
    } catch (e) {
      print(e);
    }
    return addToCardModel;
  }

  @override
  Future<RemoveCartModel> removeAllCard() async {
    String url = 'removeAll-cart';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"customer_id": CustomerData().cusID});
    RemoveCartModel removeCardModel = RemoveCartModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        removeCardModel = RemoveCartModel.fromJson(data);
        return removeCardModel;
      }
    } catch (e) {
      print(e);
    }
    return removeCardModel;
  }

  @override
  Future<RemoveItemModel> removeItem({String? productID}) async {
    String url = 'removeItem-from-cart';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode(
        {"customer_id": CustomerData().cusID, "product_id": productID});
    RemoveItemModel removeItemModel = RemoveItemModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        removeItemModel = RemoveItemModel.fromJson(data);
        return removeItemModel;
      }
    } catch (e) {
      print(e);
    }
    return removeItemModel;
  }

  @override
  Future<TotalCartModel> getTotal() async {
    String url = 'allTotal-cart';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"customer_id": CustomerData().cusID.toString()});
    TotalCartModel totalCard = TotalCartModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        totalCard = TotalCartModel.fromJson(data);
        return totalCard;
      }
    } catch (e) {
      print(e);
    }
    return totalCard;
  }

  @override
  Future<UpdateQuantityModel> updateQuantity(
      {String? productID, String? quantity}) async {
    String url = 'updateQuantity-cart';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": CustomerData().cusID,
      "product_id": productID,
      "quantity": quantity,
    });
    UpdateQuantityModel updateQuantity = UpdateQuantityModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        updateQuantity = UpdateQuantityModel.fromJson(data);
        return updateQuantity;
      }
    } catch (e) {
      print(e);
    }
    return updateQuantity;
  }

  @override
  Future<QuantityModel> getQuantity(
      {String? productID, String? quantity}) async {
    String url = 'updateQuantity-cart';
    var header = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({
      "customer_id": CustomerData().cusID,
      "product_id": productID,
      "quantity": quantity,
    });
    QuantityModel updateQuantity = QuantityModel();
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        updateQuantity = QuantityModel.fromJson(data['Your Cart']);
        return updateQuantity;
      }
    } catch (e) {
      print(e);
    }
    return updateQuantity;
  }
}
