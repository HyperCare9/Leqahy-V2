import 'quantity_model.dart';

class UpdateQuantityModel {
  bool? status;
  String? errNum;
  String? msg;
  QuantityModel? quantityModel;

  UpdateQuantityModel({
    this.status,
    this.errNum,
    this.msg,
    this.quantityModel,
  });

  factory UpdateQuantityModel.fromJson(Map<String, dynamic> json) {
    UpdateQuantityModel updateQuantityModel = UpdateQuantityModel();
    updateQuantityModel.status = json['status'];
    updateQuantityModel.errNum = json['errNum'];
    updateQuantityModel.msg = json['msg'];
    updateQuantityModel.quantityModel =
        QuantityModel.fromJson(json['Your Quantity Data']);
    return updateQuantityModel;
  }
}
