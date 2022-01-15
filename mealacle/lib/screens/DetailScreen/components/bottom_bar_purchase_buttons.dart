import 'package:flutter/material.dart';
import '../../../constants.dart';

class BottomBarPurchaseButtons extends StatelessWidget {
  final Size size;
  final Function addBagPressed;
  final Function purchasePressed;
  const BottomBarPurchaseButtons({
    Key? key,
    required this.size,
    required this.addBagPressed,
    required this.purchasePressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            addBagPressed();
          },
          child: Container(
            alignment: Alignment.center,
            width: size.width * 0.4,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 2, color: kSelectedColor),
            ),
            child: const Text(
              '장바구니 담기',
              style: TextStyle(color: kSelectedColor),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            purchasePressed();
          },
          child: Container(
            alignment: Alignment.center,
            width: size.width * 0.4,
            height: 40,
            decoration: BoxDecoration(
              color: kSelectedColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              '바로구매',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
