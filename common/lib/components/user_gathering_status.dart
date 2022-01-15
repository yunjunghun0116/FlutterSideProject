import 'package:flutter/material.dart';
import '../constants.dart';

class UserGatheringStatus extends StatelessWidget {
  final String content;
  const UserGatheringStatus({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: kGreyColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Icon(
              Icons.assignment,
              color: kWhiteColor,
            ),
            Text(
              content,
              style: const TextStyle(
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
