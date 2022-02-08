
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DetailScreenOverBottomBar extends StatelessWidget {
  const DetailScreenOverBottomBar({Key? key}) : super(key: key);

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
        border: Border.all(color: kGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child:const Text(
        '종료된 모임',
        style: TextStyle(
          color: kGreyColor,
        ),
      ),
    );
  }
}
