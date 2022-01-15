import 'package:flutter/material.dart';
import '../../../constants.dart';

class BottomBarOptionButtons extends StatelessWidget {
  final List options;
  final Function onPressed;
  final int optionIndex;
  final String optionPrice;
  const BottomBarOptionButtons({
    Key? key,
    required this.options,
    required this.onPressed,
    required this.optionIndex,
    required this.optionPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _optionButtons = [];
    int index = 0;
    for (var e in options) {
      int currentIndex = index++;
      _optionButtons.add(
        GestureDetector(
          onTap: () {
            onPressed(currentIndex, e['price']);
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: optionIndex == currentIndex
                    ? kSelectedColor
                    : kTextfieldBackgroundColor,
              ),
            ),
            child: Text(
              '세트 ${currentIndex + 1}',
              style: TextStyle(
                color: optionIndex == currentIndex
                    ? kSelectedColor
                    : kTextfieldBackgroundColor,
              ),
            ),
          ),
        ),
      );
    }
    return Row(children: _optionButtons);
  }
}
