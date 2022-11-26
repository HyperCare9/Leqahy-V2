// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:leqahy_v2/Model/accademy_model/addcomment_model.dart';

class PostCommentModel {
  bool? status;
  String? errNum;
  String? msg;
  AddCommentModel? addCommentModel;

  PostCommentModel({
    this.status,
    this.errNum,
    this.msg,
    this.addCommentModel,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    PostCommentModel postCommentModel = PostCommentModel();
    postCommentModel.status = json['status'];
    postCommentModel.errNum = json['errNum'];
    postCommentModel.msg = json['msg'];
    postCommentModel.addCommentModel =
        AddCommentModel.fromJsom(json['Comment']);
    return postCommentModel;
  }
}
