// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/login_model/user_model.dart';

class LoginModel {
  bool? status;
  String? errNum;
  String? msg;
  UserModel? userModel;

  LoginModel({
    this.status,
    this.errNum,
    this.msg,
    this.userModel,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    LoginModel loginModel = LoginModel();
    loginModel.status = json['status'];
    loginModel.errNum = json['errNum'];
    loginModel.msg = json['msg'];
    loginModel.userModel = UserModel.fromJson(json['User']);
    return loginModel;
  }
}
