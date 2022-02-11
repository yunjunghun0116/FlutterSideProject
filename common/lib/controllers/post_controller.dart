import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getPostListStream(String category) {
    return _firestore
        .collection('post')
        .where('category', isEqualTo: category)
        .snapshots();
  }
  Stream<DocumentSnapshot> getPostStream(String postId) {
    return _firestore
        .collection('post')
        .doc(postId).snapshots();
  }

  Future<bool> makePost(String category, String title, String content) async {
    DateTime nowTime = DateTime.now();
    Map<String, dynamic> body = {
      'category': category,
      'university': UserController.to.user!.university,
      'title': title,
      'content': content,
      'timeStamp': nowTime.toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
      'commentList': [],
    };
    try {
      await _firestore.collection('post').add(body);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Post>?> getPostDocs(String category) async {
    var postData = await _firestore
        .collection('post')
        .where('category', isEqualTo: category)
        .get();

    List<Post> postList = [];
    List postDocs = postData.docs;

    for (int i = 0; i < postDocs.length; i++) {
      Map<String, dynamic> body = {'id': postDocs[i].id, ...postDocs[i].data()};
      postList.add(Post.fromJson(body));
    }
    return postList;
  }

  Future<bool> uploadComment(String postId,String category, String comment) async {
    DocumentSnapshot<Map<String, dynamic>> _postData =
        await _firestore.collection('post').doc(postId).get();

    List _commentList = _postData['commentList'];
    _commentList.add({
      'comment': comment,
      'timeStamp': DateTime.now().toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
      'recommentList': [],
    });
    await _firestore
        .collection('post')
        .doc(postId)
        .update({'commentList': _commentList});
    return true;
  }

  Future<bool> uploadRecomment(
      String postId, String category, int commentIndex, String comment) async {
    DocumentSnapshot<Map<String, dynamic>> _postData =
        await _firestore.collection('post').doc(postId).get();

    List _commentList = _postData['commentList'];
    _commentList[commentIndex]['recommentList'].add({
      'comment': comment,
      'timeStamp': DateTime.now().toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
    });
    await _firestore
        .collection('post')
        .doc(postId)
        .update({'commentList': _commentList});
    return true;
  }
}
