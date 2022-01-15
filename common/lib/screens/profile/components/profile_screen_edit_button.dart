import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenEditButton extends StatelessWidget {
  final Function onPressed;
  const ProfileScreenEditButton({Key? key, required this.onPressed}) : super(key: key);

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
          '프로필 편집',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}
