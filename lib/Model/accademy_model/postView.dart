class PostViewsModel {
  bool? status;
  String? errNum;
  String? msg;
  String? postView;

  PostViewsModel({
    this.status,
    this.errNum,
    this.msg,
    this.postView,
  });

  factory PostViewsModel.fromJson(Map<String, dynamic> json) {
    PostViewsModel postViewModel = PostViewsModel();
    postViewModel.status = json['status'];
    postViewModel.errNum = json['errNum'];
    postViewModel.msg = json['msg'];
    postViewModel.postView = json['Post View'];
    return postViewModel;
  }
}
