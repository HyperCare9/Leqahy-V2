// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/doctor_model/appoinmentModel.dart';

class AddAppoinmentModel {
  bool? status;
  String? errNum;
  String? msg;
  AppoinmentModel? appoinmentModel;

  AddAppoinmentModel({
    this.status,
    this.errNum,
    this.msg,
    this.appoinmentModel,
  });

  factory AddAppoinmentModel.fromJson(Map<String, dynamic> json) {
    AddAppoinmentModel addAppoinmentModel = AddAppoinmentModel();
    addAppoinmentModel.status = json['status'];
    addAppoinmentModel.errNum = json['errNum'];
    addAppoinmentModel.msg = json['msg'];
    addAppoinmentModel.appoinmentModel =
        AppoinmentModel.fromJson(json['Appointment']);
    return addAppoinmentModel;
  }
}
