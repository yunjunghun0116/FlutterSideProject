import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenEditScreenInfoCard extends StatelessWidget {
  final String title;
  final String text;
  final Function onPressed;
  const ProfileScreenEditScreenInfoCard({
    Key? key,
    required this.title,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kGreyColor,
                  ),
                ),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
