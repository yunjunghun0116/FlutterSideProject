import 'package:flutter/material.dart';
import 'package:freeviewpt/constants.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  const RoundedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: kSelectedColor),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: kSelectedColor,
          ),
        ],
      ),
    );
  }
}
