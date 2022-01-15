import 'package:flutter/material.dart';

class GatheringCardInfo extends StatelessWidget {
  final String content;
  final IconData icon;
  const GatheringCardInfo({
    Key? key,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(content),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
