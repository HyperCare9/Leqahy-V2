import '../../Model/accademy_model/comment_model.dart';
import '../../Model/accademy_model/postComment_model.dart';
import '../../Model/accademy_model/postView.dart';
import '../../Model/accademy_model/posts_model.dart';

abstract class PostsRepository {
  Future<List<PostsModel>> getAllPosts({String? languageID});
  Future<List<SingleCommentModel>> getAllComments({String? postID});
  Future<PostCommentModel> addComment({
    String? postID,
    String? customerID,
    String? authorID,
    String? name,
    String? email,
    String? webSite,
    String? comment,
    String? date,
  });
  Future<PostViewsModel> updatePostView({String? customerID, String? postID});
}
