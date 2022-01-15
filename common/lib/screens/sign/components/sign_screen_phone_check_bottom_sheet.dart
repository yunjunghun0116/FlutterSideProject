import 'package:flutter/material.dart';
import '../../../constants.dart';

class SignScreenPhoneCheckBottomSheet extends StatelessWidget {
  final bool phoneNumberChecked;
  final Function onPressed;
  const SignScreenPhoneCheckBottomSheet({
    Key? key,
    required this.phoneNumberChecked,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (phoneNumberChecked) {
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
              color: phoneNumberChecked ? kBlueColor : kGreyColor),
          child: const Text(
            '다음',
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
