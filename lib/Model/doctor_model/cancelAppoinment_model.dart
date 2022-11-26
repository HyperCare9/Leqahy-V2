// ignore_for_file: public_member_api_docs, sort_constructors_first

class CancelAppoinmentModel {
  bool? status;
  String? errNum;
  String? msg;
  String? appointmentCancelation;

  CancelAppoinmentModel({
    this.status,
    this.errNum,
    this.msg,
    this.appointmentCancelation,
  });

  factory CancelAppoinmentModel.fromJson(Map<String, dynamic> json) {
    CancelAppoinmentModel cancelAppoinmentModel = CancelAppoinmentModel();
    cancelAppoinmentModel.status = json['status'];
    cancelAppoinmentModel.errNum = json['errNum'];
    cancelAppoinmentModel.msg = json['msg'];
    cancelAppoinmentModel.appointmentCancelation =
        json['Appointment Cancelation'];
    return cancelAppoinmentModel;
  }
}
