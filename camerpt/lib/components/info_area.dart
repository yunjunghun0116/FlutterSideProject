import 'package:flutter/material.dart';
import '../../../constants.dart';

class InfoArea extends StatelessWidget {
  final String information;
  const InfoArea({Key? key, required this.information,}) : super(key: key);

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
          information,
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
