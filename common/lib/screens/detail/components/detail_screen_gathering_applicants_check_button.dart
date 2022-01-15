import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenGatheringApplicantsCheckButton extends StatelessWidget {
  final Function onPressed;
  const DetailScreenGatheringApplicantsCheckButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlueColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          '참가자 명단 확인',
          style: TextStyle(
            color: kBlueColor,
          ),
        ),
      ),
    );
  }
}
