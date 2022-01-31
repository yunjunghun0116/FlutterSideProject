import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenUserBottomBar extends StatelessWidget {
  final Function applyPressed;
  final Function cancelPressed;
  final int userStateIndex;
  const DetailScreenUserBottomBar({
    Key? key,
    required this.applyPressed,
    required this.cancelPressed,
    required this.userStateIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: 10,
      ),
      child: GestureDetector(
        onTap: () {
          if(userStateIndex == 0){
            applyPressed();
          }else if(userStateIndex == 2){
            cancelPressed();
          }

        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            color: userStateIndex == 0
                ? kBlueColor
                : userStateIndex == 2
                ? kRedColor
                : kGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            kDetailStateList[userStateIndex]['buttonText'],
            style: const TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
