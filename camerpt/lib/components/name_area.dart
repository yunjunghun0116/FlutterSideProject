import 'package:flutter/material.dart';
import '../constants.dart';

class NameArea extends StatelessWidget {
  final String text;
  const NameArea({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kUnSelectedColor,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
