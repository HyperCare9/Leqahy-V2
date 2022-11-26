// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostsModel {
  String? postId;
  String? authorId;
  String? image;
  String? comments;
  String? status;
  String? sortOrder;
  String? dateCreated;
  String? dateUpdated;
  String? views;
  String? languageId;
  String? name;
  String? description;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? keyword;
  String? tags;

  PostsModel({
    this.postId,
    this.authorId,
    this.image,
    this.comments,
    this.status,
    this.sortOrder,
    this.dateCreated,
    this.dateUpdated,
    this.views,
    this.languageId,
    this.name,
    this.description,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.keyword,
    this.tags,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    PostsModel postsModel = PostsModel();
    postsModel.postId = json['post_id'];
    postsModel.authorId = json['author_id'];
    postsModel.image = json['image'];
    postsModel.comments = json['comments'];
    postsModel.status = json['status'];
    postsModel.sortOrder = json['sort_order'];
    postsModel.dateCreated = json['date_created'];
    postsModel.dateUpdated = json['date_updated'];
    postsModel.views = json['views'];
    postsModel.languageId = json['language_id'];
    postsModel.name = json['name'];
    postsModel.description = json['description'];
    postsModel.metaTitle = json['meta_title'];
    postsModel.metaKeywords = json['meta_keywords'];
    postsModel.metaDescription = json['meta_description'];
    postsModel.keyword = json['keyword'];
    postsModel.tags = json['tags'];
    return postsModel;
  }
}
