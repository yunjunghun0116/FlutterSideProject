import 'package:flutter/material.dart';
import '../../../constants.dart';

class MainScreenBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  const MainScreenBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: kGreyColor,
      selectedItemColor: kBlackColor,
      currentIndex: currentIndex,
      onTap: (int index) {
        onTap(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: '검색'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: '팔로우'),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'my'),
      ],
    );
  }
}
