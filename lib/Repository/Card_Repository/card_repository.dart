import '../../Model/cards_model/add_card_model.dart';
import '../../Model/cards_model/add_to_card_model.dart';
import '../../Model/cards_model/card_model.dart';
import '../../Model/cards_model/quantity_model.dart';
import '../../Model/cards_model/remove_card_model.dart';
import '../../Model/cards_model/remove_item_model.dart';
import '../../Model/cards_model/total_card.dart';
import '../../Model/cards_model/update_quantity_model.dart';

abstract class CardRepository {
  Future<AddToCardModel> addProductToCard({String? productID});
  Future<List<CardModel>> getCard({String? languageID});
  Future<AddCard> addCard({String? productID});
  Future<RemoveItemModel> removeItem({String? productID});
  Future<RemoveCartModel> removeAllCard();
  Future<TotalCartModel> getTotal();
  Future<UpdateQuantityModel> updateQuantity(
      {String? productID, String? quantity});
  Future<QuantityModel> getQuantity({String? productID, String? quantity});
}
