// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/Customer_model/customer_model.dart';

class CustomerDataModel {
  bool? status;
  String? errNum;
  String? msg;
  List<CustomerModel>? cutomerModel;

  CustomerDataModel({
    this.status,
    this.errNum,
    this.msg,
    this.cutomerModel,
  });

  factory CustomerDataModel.fromJson(Map<String, dynamic> json) {
    CustomerDataModel customerDataModel = CustomerDataModel();
    List<CustomerModel> cusModel = [];
    customerDataModel.status = json['status'];
    customerDataModel.errNum = json['errNum'];
    customerDataModel.msg = json['msg'];
    for (var c in json['Customer Data']) {
      var data = CustomerModel.fromJson(c);
      cusModel.add(data);
    }
    return customerDataModel;
  }
}
