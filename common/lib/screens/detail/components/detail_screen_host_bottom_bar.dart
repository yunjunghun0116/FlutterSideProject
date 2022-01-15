import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenHostBottomBar extends StatelessWidget {
  final Function onPressed;
  const DetailScreenHostBottomBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: 10,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: kRedColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        '모임취소하기',
        style: TextStyle(
          color: kRedColor,
        ),
      ),
    );
  }
}
