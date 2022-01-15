import 'package:flutter/material.dart';
import 'package:freeviewpt/screens/category/components/category_screen_app_bar_select_container.dart';

class CategoryScreenAppBarSelectArea extends StatelessWidget {
  final int currentIndex;
  final Function selectFunction;
  const CategoryScreenAppBarSelectArea({
    Key? key,
    required this.currentIndex,
    required this.selectFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          CategoryScreenAppBarSelectContainer(
            currentIndex: currentIndex,
            selectIndex: 0,
            title: '네일',
            selectFunction: selectFunction,
          ),
          CategoryScreenAppBarSelectContainer(
            currentIndex: currentIndex,
            selectIndex: 1,
            title: '페디',
            selectFunction: selectFunction,
          ),
          CategoryScreenAppBarSelectContainer(
            currentIndex: currentIndex,
            selectIndex: 2,
            title: '케어',
            selectFunction: selectFunction,
          ),
        ],
      ),
    );
  }
}
