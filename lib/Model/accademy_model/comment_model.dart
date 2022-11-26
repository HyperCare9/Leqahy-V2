// ignore_for_file: public_member_api_docs, sort_constructors_first
class SingleCommentModel {
  String? acadmyCommentId;
  String? parentId;
  String? postId;
  String? customerId;
  String? authorId;
  String? name;
  String? email;
  String? website;
  String? comment;
  String? status;
  String? date;

  SingleCommentModel({
    this.acadmyCommentId,
    this.parentId,
    this.postId,
    this.customerId,
    this.authorId,
    this.name,
    this.email,
    this.website,
    this.comment,
    this.status,
    this.date,
  });

  factory SingleCommentModel.fromJson(Map<String, dynamic> json) {
    SingleCommentModel singleCommentModel = SingleCommentModel();
    singleCommentModel.acadmyCommentId = json['acadmy_comment_id'];
    singleCommentModel.parentId = json['parent_id'];
    singleCommentModel.postId = json['post_id'];
    singleCommentModel.customerId = json['customer_id'];
    singleCommentModel.authorId = json['author_id'];
    singleCommentModel.name = json['name'];
    singleCommentModel.email = json['email'];
    singleCommentModel.website = json['website'];
    singleCommentModel.comment = json['comment'];
    singleCommentModel.status = json['status'];
    singleCommentModel.date = json['date'];
    return singleCommentModel;
  }
}
