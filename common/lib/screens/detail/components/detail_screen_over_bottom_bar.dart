import 'package:flutter/material.dart';

import '../../../constants.dart';

class DetailScreenOverBottomBar extends StatelessWidget {
  const DetailScreenOverBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom+10,
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: kGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          '종료된 모임',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
      ),
    );
  }
}
