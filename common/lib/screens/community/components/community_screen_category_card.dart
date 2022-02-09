import 'package:common/constants.dart';
import 'package:flutter/material.dart';

class CommunityScreenCategoryCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final Function onPressed;
  const CommunityScreenCategoryCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                icon,
                size: 40,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
