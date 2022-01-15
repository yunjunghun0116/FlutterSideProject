import 'package:flutter/material.dart';
import '../../../constants.dart';

class BottomBarCountArea extends StatelessWidget {
  final String resultPrice;
  final int foodCount;
  final Function minusClicked;
  final Function addClicked;
  const BottomBarCountArea({
    Key? key,
    required this.resultPrice,
    required this.foodCount,
    required this.minusClicked,
    required this.addClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('가격: ${kPriceComma(resultPrice)} 원'),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: kTextfieldBackgroundColor, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  minusClicked();
                },
                child: const Text('-'),
              ),
              Text('$foodCount'),
              GestureDetector(
                onTap: () {
                  addClicked();
                },
                child: const Text('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
