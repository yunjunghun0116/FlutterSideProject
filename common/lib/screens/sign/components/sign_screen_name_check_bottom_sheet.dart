import 'package:flutter/material.dart';
import '../../../constants.dart';

class SignScreenNameCheckBottomSheet extends StatelessWidget {
  final bool nameChecked;
  final Function onPressed;
  const SignScreenNameCheckBottomSheet({
    Key? key,
    required this.nameChecked,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if(nameChecked){
            onPressed();
          }

        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: nameChecked ? kBlueColor : kGreyColor),
          child: const Text(
            '완료',
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
