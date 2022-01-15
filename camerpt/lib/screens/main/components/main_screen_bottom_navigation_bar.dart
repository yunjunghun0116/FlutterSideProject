import 'package:flutter/material.dart';
import '../../../constants.dart';

class MainScreenBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTapFunction;
  const MainScreenBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        onTapFunction(index);
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: kSelectedColor,
      items: [
        BottomNavigationBarItem(
            icon: currentIndex == 0
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: '친구'),
        BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(Icons.star)
                : const Icon(Icons.star_outline),
            label: '오늘의친구'),
        BottomNavigationBarItem(
            icon: currentIndex == 2
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.remove_red_eye_outlined),
            label: '커뮤니티'),
        BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(Icons.chat_bubble)
                : const Icon(Icons.chat_bubble_outline),
            label: '채팅'),
        BottomNavigationBarItem(
            icon: currentIndex == 4
                ? const Icon(Icons.album)
                : const Icon(Icons.album_outlined),
            label: '내정보'),
      ],
    );
  }
}
