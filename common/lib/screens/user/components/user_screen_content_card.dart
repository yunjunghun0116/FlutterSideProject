import 'package:common/constants.dart';
import 'package:flutter/material.dart';

class UserScreenContentCard extends StatelessWidget {
  final String text;
  final Function onPressed;
  const UserScreenContentCard({Key? key, required this.text, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: kWhiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
