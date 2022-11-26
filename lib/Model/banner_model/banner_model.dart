// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannnerModel {
  String? bannerId;
  String? name;
  String? status;
  String? bannerImageId;
  String? languageId;
  String? title;
  String? image;
  String? link;
  String? sortOrder;

  BannnerModel({
    this.bannerId,
    this.name,
    this.status,
    this.bannerImageId,
    this.languageId,
    this.title,
    this.image,
    this.link,
    this.sortOrder,
  });

  factory BannnerModel.fromJson(Map<String, dynamic> json) {
    BannnerModel bannnerModel = BannnerModel();
    bannnerModel.bannerId = json['banner_id'];
    bannnerModel.name = json['name'];
    bannnerModel.status = json['status'];
    bannnerModel.bannerImageId = json['banner_image_id'];
    bannnerModel.languageId = json['language_id'];
    bannnerModel.title = json['title'];
    bannnerModel.image = json['image'];
    bannnerModel.link = json['link'];
    bannnerModel.sortOrder = json['sort_order'];
    return bannnerModel;
  }
}
