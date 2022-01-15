import 'package:flutter/material.dart';
import 'category_screen_app_bar_filter_area.dart';
import 'category_screen_app_bar_select_area.dart';

class CategoryScreenAppBar extends StatefulWidget {
  final Function refreshFunction;
  const CategoryScreenAppBar({
    Key? key,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  State<CategoryScreenAppBar> createState() => _CategoryScreenAppBarState();
}

class _CategoryScreenAppBarState extends State<CategoryScreenAppBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryScreenAppBarSelectArea(
            currentIndex: _currentIndex,
            selectFunction: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          CategoryScreenAppBarFilterArea(
            refreshFunction: widget.refreshFunction,
          ),
        ],
      ),
    );
  }
}
