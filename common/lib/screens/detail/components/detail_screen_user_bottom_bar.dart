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
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 10,
        left: 10,
        right: 10,
        top: 10,
      ),
      decoration: kBottomBarDecoration,
      child: GestureDetector(
        onTap: () {
          if (userStateIndex == 0) {
            applyPressed();
          } else if (userStateIndex == 2) {
            cancelPressed();
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            color: userStateIndex == 0
                ? kMainColor
                : userStateIndex == 2
                    ? kSplashBackgroundColor
                    : kGreyColor,
            borderRadius: BorderRadius.circular(10),
            border: userStateIndex == 2
                ? Border.all(
                    color: kRedColor,
                  )
                : null,
          ),
          child: Text(
            kDetailStateList[userStateIndex]['buttonText'],
            style: TextStyle(
              color: userStateIndex == 2 ? kRedColor : kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
