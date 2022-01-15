import 'package:flutter/material.dart';
import '../../../constants.dart';

class FollowScreenCardButtonArea extends StatelessWidget {
  final Function chatPressed;
  final Function detailPressed;
  const FollowScreenCardButtonArea({
    Key? key,
    required this.chatPressed,
    required this.detailPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              chatPressed();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                color: kPinkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '채팅하기',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              detailPressed();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kGreyColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '상세보기',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
