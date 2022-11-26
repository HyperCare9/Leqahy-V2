// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  String? doctorSpecialityId;
  String? languageId;
  String? specialName;
  String? doctorId;
  String? doctorImage;
  String? dayOff;
  String? startTime;
  String? appointmentDuration;
  String? email;
  String? telephone;
  String? status;
  String? token;
  String? code;
  String? price;
  String? sortOrder;
  String? dateAdded;
  String? doctorName;
  String? description;
  String? labDescription;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  String? image;

  DoctorModel(
      {this.doctorSpecialityId,
      this.languageId,
      this.specialName,
      this.doctorId,
      this.doctorImage,
      this.dayOff,
      this.startTime,
      this.appointmentDuration,
      this.email,
      this.telephone,
      this.status,
      this.token,
      this.code,
      this.price,
      this.sortOrder,
      this.dateAdded,
      this.doctorName,
      this.description,
      this.labDescription,
      this.metaTitle,
      this.metaDescription,
      this.metaKeyword,
      this.image});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    DoctorModel doctorModel = DoctorModel();
    doctorModel.doctorSpecialityId = json['doctor_speciality_id'];
    doctorModel.languageId = json['language_id'];
    doctorModel.specialName = json['Speciality Name'];
    doctorModel.doctorId = json['doctor_id'];
    doctorModel.doctorImage = json['doctor_image'];
    doctorModel.dayOff = json['day_off'];
    doctorModel.startTime = json['start_time'];
    doctorModel.appointmentDuration = json['appointment_duration'];
    doctorModel.email = json['email'];
    doctorModel.telephone = json['telephone'];
    doctorModel.status = json['status'];
    doctorModel.token = json['token'];
    doctorModel.code = json['code'];
    doctorModel.price = json['price'];
    doctorModel.sortOrder = json['sort_order'];
    doctorModel.dateAdded = json['date_added'];
    doctorModel.doctorName = json['Doctor_name'];
    doctorModel.description = json['description'];
    doctorModel.labDescription = json['lab_description'];
    doctorModel.metaTitle = json['meta_title'];
    doctorModel.metaDescription = json['meta_description'];
    doctorModel.metaKeyword = json['meta_keyword'];
    doctorModel.image = json['image'];
    return doctorModel;
  }
}
