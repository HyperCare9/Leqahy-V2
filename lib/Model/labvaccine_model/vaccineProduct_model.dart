// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/labvaccine_model/labproduct_model.dart';

class VaccineProductModel {
  bool? status;
  String? errNum;
  String? msg;
  LabProductModel? productModel;

  VaccineProductModel({
    this.status,
    this.errNum,
    this.msg,
    this.productModel,
  });

  factory VaccineProductModel.fromJson(Map<String, dynamic> json) {
    VaccineProductModel vaccineProductModel = VaccineProductModel();
    vaccineProductModel.status = json['status'];
    vaccineProductModel.errNum = json['errNum'];
    vaccineProductModel.msg = json['msg'];
    vaccineProductModel.productModel =
        LabProductModel.fromJson(json['Product']);
    return vaccineProductModel;
  }
}
