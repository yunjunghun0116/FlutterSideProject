import 'package:flutter/material.dart';

class UploadScreenIconText extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  const UploadScreenIconText({Key? key, required this.title, required this.icon, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Icon(
          icon,
          size: 25,
          color: iconColor,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
