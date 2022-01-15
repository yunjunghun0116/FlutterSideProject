import 'package:camerpt/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/friend_controller.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../chat/chat_screen.dart';
import '../community/community_screen.dart';
import '../home/home_screen.dart';
import '../todayfriend/today_friend_screen.dart';
import '../user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FriendController _friendController = Get.put(FriendController());
  final PostController _postController = Get.put(PostController());
  int _currentIndex = 0;

  Widget _getMainArea() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return TodayFriendScreen(
          todayFriendList: _friendController.friendList.sublist(0,3),
        );
      case 2:
        return const CommunityScreen();
      case 3:
        return const ChatScreen();
      case 4:
        return const UserScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getMainArea(),
        bottomNavigationBar: MainScreenBottomNavigationBar(
          currentIndex: _currentIndex,
          onTapFunction: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
