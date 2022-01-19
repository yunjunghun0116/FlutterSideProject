import 'package:flutter/material.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../home/home_screen.dart';
import '../follow/follow_screen.dart';
import '../user/user_screen.dart';
import '../../controllers/database_controller.dart';
import '../../controllers/gathering_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;

  Widget _getMainScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return HomeScreen(university: DatabaseController.to.user!.university);
      case 1:
        return FollowScreen(
            followUserList: DatabaseController.to.user!.likeUser);
      case 4:
        return UserScreen(user: DatabaseController.to.user!);
      default:
        return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMainScreen(),
      bottomNavigationBar: MainScreenBottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (int index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}
