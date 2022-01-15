import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenFollowedButton extends StatelessWidget {
  final Function onPressed;
  const ProfileScreenFollowedButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: kGreyColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          '팔로잉',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}
