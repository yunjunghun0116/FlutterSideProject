import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenHostBottomBar extends StatelessWidget {
  final Function onPressed;
  final bool over;
  const DetailScreenHostBottomBar({
    Key? key,
    required this.onPressed,
    required this.over,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom+10,
          top: 10,
          left: 10,
          right: 10,
        ),
        decoration: kBottomBarDecoration,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: over ? kGreyColor : kRedColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '모임취소하기',
            style: TextStyle(
              color: over ? kGreyColor : kRedColor,
            ),
          ),
        ),
      ),
    );
  }
}
