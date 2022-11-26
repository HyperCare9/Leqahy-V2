// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/cards_model/checkOut_model.dart';

class TotalCartModel {
  bool? status;
  String? errNum;
  String? msg;
  CheckOutModel? checkOutModel;

  TotalCartModel({
    this.status,
    this.errNum,
    this.msg,
    this.checkOutModel,
  });

  factory TotalCartModel.fromJson(Map<String, dynamic> json) {
    TotalCartModel totalCartModel = TotalCartModel();
    totalCartModel.status = json['status'];
    totalCartModel.errNum = json['errNum'];
    totalCartModel.msg = json['msg'];
    totalCartModel.checkOutModel =
        CheckOutModel.fromJson(json['Your Chick out']);
    return totalCartModel;
  }
}
