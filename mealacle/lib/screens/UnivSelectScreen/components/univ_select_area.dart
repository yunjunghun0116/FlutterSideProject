import 'package:flutter/material.dart';
import '../../../constants.dart';

class UnivSelectArea extends StatelessWidget {
  final bool selectedTown;
  final int currentSelectedTown;
  final List univKeys;
  final Function onClickedFunc;
  const UnivSelectArea(
      {Key? key,
      required this.selectedTown,
      required this.currentSelectedTown,
      required this.univKeys,
      required this.onClickedFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 8 / 6,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      children: List.generate(kUniversity.length, (index) {
        return GestureDetector(
          onTap: () {
            onClickedFunc(index);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: kTextColor),
              borderRadius: BorderRadius.circular(5),
              color: (currentSelectedTown == index)
                  ? kSelectedColor
                  : Colors.white,
            ),
            child: Center(
              child: Text(
                univKeys[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
