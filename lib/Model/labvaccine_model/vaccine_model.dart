// ignore_for_file: public_member_api_docs, sort_constructors_first

class VaccineModel {
  String? productTypeCode;
  String? productTypeName;
  String? extraCategory;
  String? name;
  String? quantity;
  String? dose;
  String? sortOrder;

  VaccineModel({
    this.productTypeCode,
    this.productTypeName,
    this.extraCategory,
    this.name,
    this.quantity,
    this.dose,
    this.sortOrder,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    VaccineModel vaccineModel = VaccineModel();
    vaccineModel.productTypeCode = json['product_type_code'];
    vaccineModel.productTypeName = json['product_type_name'];
    vaccineModel.extraCategory = json['extra_category'];
    vaccineModel.name = json['name'];
    vaccineModel.quantity = json['quantity'];
    vaccineModel.dose = json['dose'];
    vaccineModel.sortOrder = json['sort_order'];
    return vaccineModel;
  }
}
