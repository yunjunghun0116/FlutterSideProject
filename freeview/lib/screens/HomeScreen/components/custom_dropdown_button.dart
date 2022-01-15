import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hintText;
  final int? buttonValue;
  final Function onChangedFunction;
  final List<DropdownMenuItem<int>> itemList;
  const CustomDropdownButton({
    Key? key,
    required this.buttonValue,
    required this.onChangedFunction,
    required this.itemList,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          alignment: Alignment.center,
          hint: Text(
            hintText,
            style: const TextStyle(color: Colors.black),
          ), //거리 샵정보
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.black,
          ),
          underline: null,
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          value: buttonValue,
          onChanged: (int? val) {
            onChangedFunction(val);
          },
          items: itemList,
        ),
      ),
    );
  }
}
