class DoctorInfoModel {
  String? doctorSpecialityId;
  String? languageId;
  String? specialName;
  String? doctorId;
  String? doctorImage;
  String? dayOff;
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

  DoctorInfoModel({
    this.doctorSpecialityId,
    this.languageId,
    this.specialName,
    this.doctorId,
    this.doctorImage,
    this.dayOff,
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
    this.image,
  });

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) {
    DoctorInfoModel doctorInfoModel = DoctorInfoModel();
    doctorInfoModel.doctorSpecialityId = json['doctor_speciality_id'];
    doctorInfoModel.languageId = json['language_id'];
    doctorInfoModel.specialName = json['Speciality Name'];
    doctorInfoModel.doctorId = json['doctor_id'];
    doctorInfoModel.doctorImage = json['doctor_image'];
    doctorInfoModel.dayOff = json['day_off'];
    doctorInfoModel.email = json['email'];
    doctorInfoModel.telephone = json['telephone'];
    doctorInfoModel.status = json['status'];
    doctorInfoModel.token = json['token'];
    doctorInfoModel.code = json['code'];
    doctorInfoModel.price = json['price'];
    doctorInfoModel.sortOrder = json['sort_order'];
    doctorInfoModel.dateAdded = json['date_added'];
    doctorInfoModel.doctorName = json['Doctor_name'];
    doctorInfoModel.description = json['description'];
    doctorInfoModel.labDescription = json['lab_description'];
    doctorInfoModel.metaTitle = json['meta_title'];
    doctorInfoModel.metaDescription = json['meta_description'];
    doctorInfoModel.metaKeyword = json['meta_keyword'];
    doctorInfoModel.image = json['image'];
    return doctorInfoModel;
  }
}
