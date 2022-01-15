import 'package:flutter/material.dart';
import 'package:freeviewpt/constants.dart';

class CategoryScreenDifferentDesignTitle extends StatelessWidget {
  final bool isImageOnly;
  final Function onClicked;
  const CategoryScreenDifferentDesignTitle(
      {Key? key, required this.isImageOnly, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration:const  BoxDecoration(
        border: Border(
          top: BorderSide(color: kUnSelectedColor),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '네일 디자인',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              onClicked();
            },
            child: Row(
              children: [
                const Text('사진만 보기'),
                const SizedBox(width: 5),
                isImageOnly
                    ? const Icon(Icons.check_box_rounded)
                    : const Icon(Icons.check_box_outline_blank),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
