import 'package:flutter/material.dart';

class UserScreenLikeButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Size size;
  const UserScreenLikeButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        width: size.width/4,
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
