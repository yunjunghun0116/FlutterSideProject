import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenBottomBar extends StatelessWidget {
  final Function chatPressed;
  const ProfileScreenBottomBar({Key? key, required this.chatPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: 10,
        left: 10,
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          chatPressed();
        },
        child: Container(
          alignment: Alignment.center,
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
    );
  }
}
