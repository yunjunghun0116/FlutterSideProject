import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
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
    return _firestore.collection('post').doc(postId).snapshots();
  }

  Future<bool> makePost({
    required String category,
    required String title,
    required String content,
  }) async {
    DateTime nowTime = DateTime.now();
    Map<String, dynamic> body = {
      'category': category,
      'city': UserController.to.user!.city,
      'town': UserController.to.user!.town,
      'title': title,
      'content': content,
      'timeStamp': nowTime.toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
      'authorImageUrl':UserController.to.user!.imageUrl,
      'commentList': [],
      'reportedList': [],
    };
    try {
      await _firestore.collection('post').add(body);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> uploadComment({
    required String postId,
    required String category,
    required String comment,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _postData =
        await _firestore.collection('post').doc(postId).get();

    List _commentList = _postData['commentList'];
    _commentList.add({
      'comment': comment,
      'timeStamp': DateTime.now().toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
      'authorImageUrl':UserController.to.user!.imageUrl,
      'recommentList': [],
    });
    await _firestore
        .collection('post')
        .doc(postId)
        .update({'commentList': _commentList});
    return true;
  }

  Future<bool> uploadRecomment({
    required String postId,
    required String category,
    required int commentIndex,
    required String comment,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _postData =
        await _firestore.collection('post').doc(postId).get();

    List _commentList = _postData['commentList'];
    _commentList[commentIndex]['recommentList'].add({
      'comment': comment,
      'timeStamp': DateTime.now().toString(),
      'authorId': UserController.to.user!.id,
      'authorName': UserController.to.user!.name,
      'authorImageUrl':UserController.to.user!.imageUrl,
    });
    await _firestore
        .collection('post')
        .doc(postId)
        .update({'commentList': _commentList});
    return true;
  }

  Future<bool> updatePost({
    required String postId,
    required String title,
    required String content,
  }) async {
    try {
      await _firestore.collection('post').doc(postId).update({
        'title': title,
        'content': content,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> reportPost(
      {required String postId, required String userId}) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
    await _firestore.collection('post').doc(postId).get();
    List _reportedList = _gatheringData['reportedList'];
    if (!_reportedList.contains(userId)) {
      _reportedList.add(userId);
    }
    await _firestore
        .collection('post')
        .doc(postId)
        .update({'reportedList': _reportedList});
  }
}
