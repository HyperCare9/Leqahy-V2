// ignore_for_file: public_member_api_docs, sort_constructors_first
class WorkTimeModel {
  bool? status;
  String? errNum;
  String? msg;
  String? date;
  List<dynamic>? times;

  WorkTimeModel({
    this.status,
    this.errNum,
    this.msg,
    this.date,
    this.times,
  });

  factory WorkTimeModel.fromJson(Map<String, dynamic> json) {
    WorkTimeModel workTimeModel = WorkTimeModel();
    workTimeModel.status = json['status'];
    workTimeModel.errNum = json['errNum'];
    workTimeModel.msg = json['msg'];
    workTimeModel.date = json['Date'];
    workTimeModel.times = json['Work Doctor Unreserved Appointments'];
    return workTimeModel;
  }
}
