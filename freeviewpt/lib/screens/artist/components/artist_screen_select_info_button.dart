import 'package:flutter/material.dart';
import '../../../constants.dart';

class ArtistScreenSelectInfoButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final String title;
  const ArtistScreenSelectInfoButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kUnSelectedColor,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}
