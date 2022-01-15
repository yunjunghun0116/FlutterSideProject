import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeScreenSubTitle extends StatelessWidget {
  final String title;
  const HomeScreenSubTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            title,
            style: const TextStyle(
              color: kTitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
