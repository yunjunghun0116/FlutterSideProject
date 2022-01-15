import 'package:camerpt/constants.dart';
import 'package:flutter/material.dart';

class CommunityScreenGameFilterButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final int currentGameIndex;
  final int gameIndex;
  const CommunityScreenGameFilterButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.currentGameIndex,
    required this.gameIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: currentGameIndex == gameIndex
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kSelectedColor,
                    width: 2
                  ),
                ),
              )
            : null,
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
