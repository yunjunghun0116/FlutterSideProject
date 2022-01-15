import '../models/friend.dart';
import 'package:get/get.dart';

class FriendController extends GetxController {
  static FriendController get to => Get.find();
  List<Friend> _friendList = [];

  List<Friend> get friendList => _friendList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _friendList = [
      Friend(
        imageUrl: 'assets/images/user_image_1.jpeg',
        name: '지원',
        gameList: [
         'leagueOfLegends',
         'battleGrounds',
         'overWatch',
        ],
        tier: {
          'leagueOfLegends':'골드',
          'battleGrounds':1900,
          'overWatch':'골드',
        },
        information: '정훈이 여자친구',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_2.jpeg',
        name: '정영민',
        gameList: [
         'leagueOfLegends',
         'battleGrounds',
        ],
        tier: {
          'leagueOfLegends':'다이아',
          'battleGrounds':1400,
        },
        information: '다이아 정글러',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_3.jpeg',
        name: '이태희',
        gameList: [
         'leagueOfLegends',
         'battleGrounds',
        ],
        tier: {
          'leagueOfLegends':'마스터',
          'battleGrounds':1700,
        },
        information: '롤 마스터 두계정',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_4.jpeg',
        name: '이준혁',
        gameList: [
         'leagueOfLegends',
         'battleGrounds',
         'overWatch',
        ],
        tier: {
          'leagueOfLegends':'플레티넘',
          'battleGrounds':1700,
          'overWatch':'마스터'
        },
        information: '올라운더',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_2.jpeg',
        name: '채승규',
        gameList: [
         'leagueOfLegends',
        ],
        tier: {
          'leagueOfLegends':'플레티넘',
        },
        information: '플레 정글러',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_4.jpeg',
        name: '하상호',
        gameList: [
         'leagueOfLegends',
        ],
        tier: {
          'leagueOfLegends':'골드',
        },
        information: '골드 원딜러',
      ),
      Friend(
        imageUrl: 'assets/images/user_image_2.jpeg',
        name: '정재성',
        gameList: [
         'leagueOfLegends',
         'overWatch',
        ],
        tier: {
          'leagueOfLegends':'실버',
          'overWatch':'플레티넘'
        },
        information: '오버워치 플레티넘',
      ),
    ];
  }
}
