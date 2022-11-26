// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerAppoinmentModel {
  String? appointmentId;
  String? doctorId;
  String? customerId;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  String? doctorImage;
  String? name;

  CustomerAppoinmentModel({
    this.appointmentId,
    this.doctorId,
    this.customerId,
    this.appointmentDate,
    this.appointmentTime,
    this.status,
    this.doctorImage,
    this.name,
  });

  factory CustomerAppoinmentModel.fromJson(Map<String, dynamic> json) {
    CustomerAppoinmentModel cusAppModel = CustomerAppoinmentModel();
    cusAppModel.appointmentId = json['appointment_id'];
    cusAppModel.doctorId = json['doctor_id'];
    cusAppModel.customerId = json['customer_id'];
    cusAppModel.appointmentDate = json['appointment_date'];
    cusAppModel.appointmentTime = json['appointment_time'];
    cusAppModel.status = json['appointment_status1'];
    cusAppModel.doctorImage = json['doctor_image'];
    cusAppModel.name = json['name'];
    return cusAppModel;
  }
}
