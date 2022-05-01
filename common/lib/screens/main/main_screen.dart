import 'package:common/screens/community/community_screen.dart';
import 'package:common/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../home/home_screen.dart';
import '../follow/follow_screen.dart';
import '../user/user_screen.dart';

class MainScreen extends StatefulWidget {
  final int startIndex;
  const MainScreen({Key? key, this.startIndex = 0}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;

  @override
  initState() {
    super.initState();
    if (widget.startIndex != 0) {
      setState(() {
        _currentScreenIndex = widget.startIndex;
      });
    }
  }

  // Widget _getMainScreen() {
  //   switch (_currentScreenIndex) {
  //     case 0:
  //       return const HomeScreen();
  //     case 1:
  //       return const FollowScreen();
  //     case 2:
  //       return const CommunityScreen();
  //     case 3:
  //       return const UserScreen();
  //     default:
  //       return const HomeScreen();
  //   }
  // }

  Widget _getMainScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const FollowScreen();
      case 3:
        return const CommunityScreen();
      case 4:
        return const UserScreen();
      default:
        return const HomeScreen();
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
