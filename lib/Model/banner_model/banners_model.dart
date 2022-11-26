import 'banner_model.dart';

class BannersModel {
  bool? status;
  String? errNum;
  String? msg;
  List<BannnerModel>? banners;

  BannersModel({
    this.status,
    this.errNum,
    this.msg,
    this.banners,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    BannersModel bannersModel = BannersModel();
    List<BannnerModel> banermodel = [];
    bannersModel.status = json['status'];
    bannersModel.errNum = json['errNum'];
    bannersModel.msg = json['msg'];
    for (var c in json['Oc_banners']) {
      var data = BannnerModel.fromJson(c);
      banermodel.add(data);
    }
    return bannersModel;
  }
}
