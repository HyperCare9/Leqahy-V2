// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateCustomerModel {
  bool? status;
  String? errNum;
  String? msg;
  int? user;

  UpdateCustomerModel({
    this.status,
    this.errNum,
    this.msg,
    this.user,
  });

  factory UpdateCustomerModel.fromJson(Map<String, dynamic> json) {
    UpdateCustomerModel updateCustomerModel = UpdateCustomerModel();
    updateCustomerModel.status = json['status'];
    updateCustomerModel.errNum = json['errNum'];
    updateCustomerModel.msg = json['msg'];
    updateCustomerModel.user = json['User'];
    return updateCustomerModel;
  }
}
