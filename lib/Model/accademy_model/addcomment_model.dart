// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddCommentModel {
  String? postId;
  String? customerId;
  String? authorId;
  String? name;
  String? email;
  String? website;
  String? comment;
  int? status;
  String? date;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddCommentModel({
    this.postId,
    this.customerId,
    this.authorId,
    this.name,
    this.email,
    this.website,
    this.comment,
    this.status,
    this.date,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory AddCommentModel.fromJsom(Map<String, dynamic> json) {
    AddCommentModel addCommentModel = AddCommentModel();
    addCommentModel.postId = json['post_id'];
    addCommentModel.customerId = json['customer_id'];
    addCommentModel.authorId = json['author_id'];
    addCommentModel.name = json['name'];
    addCommentModel.email = json['email'];
    addCommentModel.website = json['website'];
    addCommentModel.comment = json['comment'];
    addCommentModel.status = json['status'];
    addCommentModel.date = json['date'];
    addCommentModel.updatedAt = json['updated_at'];
    addCommentModel.createdAt = json['created_at'];
    addCommentModel.id = json['id'];
    return addCommentModel;
  }
}
