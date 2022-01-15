import 'package:flutter/material.dart';

class ChatScreenSelectBox extends StatelessWidget {
  final Function onClicked;
  final int currentIndex;
  final int mainIndex;
  final String title;
  const ChatScreenSelectBox({
    Key? key,
    required this.onClicked,
    required this.currentIndex,
    required this.mainIndex,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: currentIndex == mainIndex
              ? const Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                )
              : null,
        ),
        child: Text(
          ' $title ',
          style: TextStyle(
            fontSize: 16,
            color: currentIndex == mainIndex ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
