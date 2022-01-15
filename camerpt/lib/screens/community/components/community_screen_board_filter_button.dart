import 'package:camerpt/constants.dart';
import 'package:flutter/material.dart';

class CommunityScreenBoardFilterButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final int currentBoardIndex;
  final int boardIndex;
  const CommunityScreenBoardFilterButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.currentBoardIndex,
      required this.boardIndex,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: currentBoardIndex == boardIndex? const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kSelectedColor,
              width: 2
            ),
          ),
        ):null,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
