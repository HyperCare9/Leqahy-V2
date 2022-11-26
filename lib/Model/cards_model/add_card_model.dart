import 'add_to_card_model.dart';

class AddCard {
  bool? status;
  String? errNum;
  String? msg;
  // AddToCardModel? yourCart;

  AddCard({
    this.status,
    this.errNum,
    this.msg,
    // this.yourCart,
  });

  factory AddCard.fromJson(Map<String, dynamic> json) {
    AddCard addCard = AddCard();
    addCard.status = json['status'];
    addCard.errNum = json['errNum'];
    addCard.msg = json['msg'];
    // addCard.yourCart = AddToCardModel.fromJson(json['Your Cart']);
    return addCard;
  }
}
