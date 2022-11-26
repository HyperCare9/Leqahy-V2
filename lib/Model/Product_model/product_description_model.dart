// ignore_for_file: public_member_api_docs, sort_constructors_first
class PrdouctDescriptionModel {
  String? productId;
  String? languageId;
  String? name;
  String? description;
  String? tag;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;

  PrdouctDescriptionModel({
    this.productId,
    this.languageId,
    this.name,
    this.description,
    this.tag,
    this.metaTitle,
    this.metaDescription,
    this.metaKeyword,
  });

  factory PrdouctDescriptionModel.fromJson(Map<String, dynamic> json) {
    PrdouctDescriptionModel prdouctDescriptionModel = PrdouctDescriptionModel();
    prdouctDescriptionModel.productId = json['product_id'];
    prdouctDescriptionModel.languageId = json['language_id'];
    prdouctDescriptionModel.name = json['name'];
    prdouctDescriptionModel.description = json['description'];
    prdouctDescriptionModel.tag = json['tag'];
    prdouctDescriptionModel.metaTitle = json['meta_title'];
    prdouctDescriptionModel.metaDescription = json['meta_description'];
    prdouctDescriptionModel.metaKeyword = json['meta_keyword'];
    return prdouctDescriptionModel;
  }
}
