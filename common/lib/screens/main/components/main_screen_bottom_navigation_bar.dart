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
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: kGreyColor,
      selectedItemColor: kBlackColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: (int index) {
        onTap(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: '팔로우'),
        BottomNavigationBarItem(icon: Icon(Icons.local_cafe_outlined), label: '커뮤니티'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'my'),
      ],
    );
  }
}
