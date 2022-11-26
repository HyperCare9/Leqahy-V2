class LabProductModel {
  String? customerName;
  String? customerPhone;
  String? labName;
  String? checkCount;
  String? labvacDate;
  String? reserverName;
  int? labvacStatus;
  String? updatedAt;
  String? createdAt;
  int? id;

  LabProductModel({
    this.customerName,
    this.customerPhone,
    this.labName,
    this.checkCount,
    this.labvacDate,
    this.reserverName,
    this.labvacStatus,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory LabProductModel.fromJson(Map<String, dynamic> json) {
    LabProductModel productModel = LabProductModel();
    productModel.customerName = json["customer_name"];
    productModel.customerPhone = json["customer_phone"];
    productModel.labName = json["lab_name"];
    productModel.checkCount = json["check_count"];
    productModel.labvacDate = json["labvac_date"];
    productModel.reserverName = json["reserver_name"];
    productModel.labvacStatus = json["labvac_status"];
    productModel.updatedAt = json["updated_at"];
    productModel.createdAt = json["created_at"];
    productModel.id = json["id"];
    return productModel;
  }
}
