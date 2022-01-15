import 'package:flutter/material.dart';
import '../../../constants.dart';

class CategorySelectTopArea extends StatelessWidget {
  final int selectedCategoryIndex;
  final Function onPressed;
  const CategorySelectTopArea(
      {Key? key, required this.selectedCategoryIndex, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kCategoryList.map((e) {
          return InkWell(
            onTap: () {
              onPressed(e[0]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(
                e[1],
                style: TextStyle(
                  color: selectedCategoryIndex == e[0]
                      ? kTextColor
                      : kTextfieldBackgroundColor,
                  fontWeight: selectedCategoryIndex == e[0]
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
