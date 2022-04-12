import 'package:bookchigo/screens/calendar/calendar_screen.dart';
import 'package:bookchigo/screens/favorite/favorite_screen.dart';
import 'package:bookchigo/screens/note/note_screen.dart';
import 'package:bookchigo/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget _getMainScreen() {
    switch (_currentIndex) {
      case 0:
        return  HomeScreen();
      case 1:
        return const CalendarScreen();
      case 2:
        return const NoteScreen();
      case 3:
        return const FavoriteScreen();
      case 4:
        return const UserScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getMainScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: '독서달력',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: '독서노트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: '즐겨찾기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '내정보',
          ),
        ],
      ),
    );
  }
}
