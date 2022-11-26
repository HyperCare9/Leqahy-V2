// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppoinmentModel {
  int? id;
  int? appointmentStatus;
  String? doctorID;
  String? customerID;
  String? appointmentDate;
  String? appointmentTime;
  String? updatedAt;
  String? createdAt;

  AppoinmentModel({
    this.id,
    this.appointmentStatus,
    this.doctorID,
    this.customerID,
    this.appointmentDate,
    this.appointmentTime,
    this.updatedAt,
    this.createdAt,
  });

  factory AppoinmentModel.fromJson(Map<String, dynamic> json) {
    AppoinmentModel appoinmentModel = AppoinmentModel();
    appoinmentModel.id = json['id'];
    appoinmentModel.appointmentStatus = json['appointment_status'];
    appoinmentModel.doctorID = json['doctor_id'];
    appoinmentModel.customerID = json['customer_id'];
    appoinmentModel.appointmentDate = json['appointment_date'];
    appoinmentModel.appointmentTime = json['appointment_time'];
    appoinmentModel.updatedAt = json['updated_at'];
    appoinmentModel.createdAt = json['created_at'];
    return appoinmentModel;
  }
}
