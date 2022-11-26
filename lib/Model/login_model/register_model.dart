// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/login_model/register_user_model.dart';

class RegisterModel {
  bool? status;
  String? errNum;
  String? msg;
  RegisterUserModel? registerUserModel;

  RegisterModel({
    this.status,
    this.errNum,
    this.msg,
    this.registerUserModel,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    RegisterModel registerModel = RegisterModel();
    registerModel.status = json['status'];
    registerModel.errNum = json['errNum'];
    registerModel.msg = json['msg'];
    registerModel.registerUserModel = RegisterUserModel.fromJson(json['User']);
    return registerModel;
  }
}
