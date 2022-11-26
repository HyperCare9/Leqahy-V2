// ignore_for_file: public_member_api_docs, sort_constructors_first

class DeleteUserModel {
  bool? status;
  String? errNum;
  String? msg;
  int? customerAccount;

  DeleteUserModel({
    this.status,
    this.errNum,
    this.msg,
    this.customerAccount,
  });

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) {
    DeleteUserModel deleteUserModel = DeleteUserModel();
    deleteUserModel.status = json['status'];
    deleteUserModel.errNum = json['errNum'];
    deleteUserModel.msg = json['msg'];
    deleteUserModel.customerAccount = json['customer Account'];
    return deleteUserModel;
  }
}
