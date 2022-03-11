import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenFollowButton extends StatelessWidget {
  final Function onPressed;
  const ProfileScreenFollowButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: kYellowColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          '팔로잉',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
