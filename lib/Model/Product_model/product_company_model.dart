class ProductCompanyModel {
  int? manufacturerId;
  String? name;
  String? image;
  String? sortOrder;

  ProductCompanyModel({
    this.manufacturerId,
    this.name,
    this.image,
    this.sortOrder,
  });

  factory ProductCompanyModel.fromJson(Map<String, dynamic> json) {
    ProductCompanyModel companiesModel = ProductCompanyModel();
    companiesModel.manufacturerId = json['manufacturer_id'];
    companiesModel.name = json['name'];
    companiesModel.image = json['image'];
    companiesModel.sortOrder = json['sort_order'];
    return companiesModel;
  }
}
