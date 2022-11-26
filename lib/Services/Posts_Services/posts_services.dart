import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../Model/accademy_model/postComment_model.dart';
import '../../Model/accademy_model/postView.dart';
import '../../Model/accademy_model/posts_model.dart';
import '../../Repository/Posts_Repository/posts_repository.dart';

import '../../Constant/string.dart';
import '../../Model/accademy_model/comment_model.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<PostsModel>> getAllPosts({String? languageID}) async {
    List<PostsModel> postsModel = [];
    String url = 'get-main-t_posts';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"language_id": languageID});

    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Posts']);
        postsModel = decoded.map((e) => PostsModel.fromJson(e)).toList();
        return postsModel;
      }
    } catch (e) {
      print(e);
    }
    return postsModel;
  }

  @override
  Future<PostCommentModel> addComment(
      {String? postID,
      String? customerID,
      String? authorID,
      String? name,
      String? email,
      String? webSite,
      String? comment,
      String? date}) async {
    PostCommentModel postCommentModel = PostCommentModel();
    String url = 'get-main-t_add_comment';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode(
      {
        "post_id": postID,
        "customer_id": customerID,
        "author_id": authorID,
        "name": name,
        "email": email,
        "website": webSite,
        "comment": comment,
        "date": date,
      },
    );
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        postCommentModel = PostCommentModel.fromJson(data);
        return postCommentModel;
      }
    } catch (e) {
      print(e);
    }
    return postCommentModel;
  }

  @override
  Future<List<SingleCommentModel>> getAllComments({String? postID}) async {
    List<SingleCommentModel> commentsModel = [];
    String url = 'get-main-all_comment';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"post_id": postID});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Comments']);
        commentsModel =
            decoded.map((e) => SingleCommentModel.fromJson(e)).toList();
        return commentsModel;
      }
    } catch (e) {
      print(e);
    }
    return commentsModel;
  }

  @override
  Future<PostViewsModel> updatePostView(
      {String? customerID, String? postID}) async {
    PostViewsModel postViewModel = PostViewsModel();
    String url = 'add-main-t_posts_views';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"customer_id": customerID, "post_id": postID});
    try {
      var response = await http.post(Uri.parse('$baseURL$url'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        postViewModel = PostViewsModel.fromJson(data);
        return postViewModel;
      }
    } catch (e) {
      print(e);
    }
    return postViewModel;
  }
}
