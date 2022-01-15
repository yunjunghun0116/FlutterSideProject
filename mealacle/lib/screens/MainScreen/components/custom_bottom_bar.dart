import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function onPressed;
  const CustomBottomBar(
      {Key? key, required this.selectedIndex, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kSelectedColor,
      currentIndex: selectedIndex,
      onTap: (int index) {
        onPressed(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'User'),
      ],
    );
  }
}
