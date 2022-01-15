import 'package:flutter/material.dart';

class CategoryScreenAppBarSelectContainer extends StatelessWidget {
  final int currentIndex;
  final int selectIndex;
  final String title;
  final Function selectFunction;
  const CategoryScreenAppBarSelectContainer({
    Key? key,
    required this.currentIndex,
    required this.selectIndex,
    required this.title,
    required this.selectFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectFunction(selectIndex);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: currentIndex == selectIndex?const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ):null,
          child: Text(
            ' $title ',
            style: currentIndex == selectIndex
                ? const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                : const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),
    );
  }
}
