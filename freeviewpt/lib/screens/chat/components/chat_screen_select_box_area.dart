import 'package:flutter/material.dart';
import 'chat_screen_select_box.dart';

class ChatScreenSelectBoxArea extends StatelessWidget {
  final int currentIndex;
  final Function designerClicked;
  final Function designClicked;
  const ChatScreenSelectBoxArea({
    Key? key,
    required this.currentIndex,
    required this.designerClicked,
    required this.designClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          )
        )
      ),
      child: Row(
        children: [
          ChatScreenSelectBox(
            onClicked: designerClicked,
            currentIndex: currentIndex,
            mainIndex: 0,
            title: '디자이너',
          ),
          ChatScreenSelectBox(
            onClicked: designClicked,
            currentIndex: currentIndex,
            mainIndex: 1,
            title: '디자인',
          ),
        ],
      ),
    );
  }
}
