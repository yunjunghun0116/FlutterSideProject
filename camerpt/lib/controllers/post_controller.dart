import 'package:camerpt/models/post.dart';
import 'package:camerpt/models/recomment.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();
  List<Post> _postList = [];

  List<Post> get postList => _postList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //TODO 데이터 연결시 바로 롤/자유게시판이 default 그리고 이후 다른걸클릭시 데이터 바꿔주기
    _postList = [
      Post(
        title: '새벽에 배고플 때 먹는 양념 블랙라벨',
        content: '너무 맛있다 뼈없고 부드럽고 양도 적절하고 고맙다 kfc',
        likeCount: 3,
        recommentList: [
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
        ],
        timeStamp: '2022-01-02 17:35',
        authorId: '123456',
        authorName: '익명',
      ),
      Post(
        title: '내년 남자 기숙사',
        content: '학점 3점초 가능성 얼마나 있나요ㅜ',
        likeCount: 1,
        recommentList: [
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
        ],
        timeStamp: '2022-01-01 23:45',
        authorId: '123456',
        authorName: '익명',
      ),
      Post(
        title: '알바',
        content: '주말알바 지원하고 오늘 첫 근무였는데 사장님이 갑자기 토 일 나오지 말고 토요일만 나오래 이러면 한달에 20만원도 못버는데..',
        likeCount: 3,
        recommentList: [
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
          Recomment(
            authorId: '1234',
            authorName: '익명',
            title: '그러게 말이다',
            timeStamp: '2022-01-02 19:40',
          ).toMap(),
        ],
        timeStamp: '2022-01-01 21:35',
        authorId: '123456',
        authorName: '익명',
      ),
    ];
  }
}
