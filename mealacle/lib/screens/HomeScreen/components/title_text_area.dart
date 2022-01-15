import 'package:flutter/material.dart';
import '../../../constants.dart';

class TitleTextArea extends StatelessWidget {
  final String title;
  const TitleTextArea({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kDivider(1),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        kDivider(1),
      ],
    );
  }
}