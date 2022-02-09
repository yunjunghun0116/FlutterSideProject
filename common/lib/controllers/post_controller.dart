import 'package:common/models/comment.dart';
import 'package:common/models/post.dart';
import 'package:common/models/recomment.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();

  List<Post> _postList = [];
  List<Post> get postList => _postList;

  Future<void> setPostList(String category) async {
    _postList = [
      Post(
        id: '1234',
        university: '123대학교',
        category: '자유게시판',
        title: '제목1',
        content: '내용1',
        timeStamp: '3일전',
        authorId: '1234',
        authorName: 'name',
        commentList: [
          Comment(
            comment: '댓글내용1',
            timeStamp: '4일전',
            authorId: '1234',
            authorName: 'name1',
            recommentList: [],
          ),
          Comment(
            comment: '댓글내용2',
            timeStamp: '7일전',
            authorId: '1234',
            authorName: 'name2',
            recommentList: [
              Recomment(
                comment: '대댓글내용1',
                timeStamp: '7일전',
                authorId: 'gkgkgk',
                authorName: '이름3',
              )
            ],
          ),
          Comment(
            comment: '댓글내용3',
            timeStamp: '11일전',
            authorId: '1234',
            authorName: 'name3',
            recommentList: [],
          ),
        ],
      ),
      Post(
        id: '1234',university: '123대학교',
        category: '자유게시판',
        title: '제목1',
        content: '내용1',
        timeStamp: '3일전',
        authorId: '1234',
        authorName: 'name',
        commentList: [
          Comment(
            comment: '댓글내용1',
            timeStamp: '4일전',
            authorId: '1234',
            authorName: 'name1',
            recommentList: [],
          ),
        ],
      ),
      Post(
        id: '1234',university: '123대학교',
        category: '자유게시판',
        title: '제목1',
        content: '내용1',
        timeStamp: '3일전',
        authorId: '1234',
        authorName: 'name',
        commentList: [
          Comment(
            comment: '댓글내용1',
            timeStamp: '4일전',
            authorId: '1234',
            authorName: 'name1',
            recommentList: [],
          ),
          Comment(
            comment: '댓글내용3',
            timeStamp: '11일전',
            authorId: '1234',
            authorName: 'name3',
            recommentList: [],
          ),
        ],
      ),
    ];
    update();
  }
}
