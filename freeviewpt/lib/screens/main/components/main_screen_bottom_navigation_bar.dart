import 'package:flutter/material.dart';
import 'package:freeviewpt/constants.dart';

class MainScreenBottomNavigationBar extends StatelessWidget {
  final int currentBottomBarIndex;
  final Function onTapFunction;
  const MainScreenBottomNavigationBar({
    Key? key,
    required this.currentBottomBarIndex,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentBottomBarIndex,
      onTap: (int index) {
        onTapFunction(index);
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: kSelectedColor,
      items: [
        BottomNavigationBarItem(
            icon: currentBottomBarIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: '홈'),
        BottomNavigationBarItem(
          icon: currentBottomBarIndex == 1
              ? const Icon(Icons.view_list)
              : const Icon(Icons.view_list_outlined),
          label: '카테고리',
        ),
        BottomNavigationBarItem(
            icon: currentBottomBarIndex == 2
                ? const Icon(Icons.chat_bubble)
                : const Icon(Icons.chat_bubble_outline),
            label: '채팅'),
        BottomNavigationBarItem(
            icon: currentBottomBarIndex == 3
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outlined),
            label: 'my'),
      ],
    );
  }
}
