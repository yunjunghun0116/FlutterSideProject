import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final Size size;
  final Function backPressed;
  final Function bagPressed;
  final String userUniv;
  const TopAppBar({
    Key? key,
    required this.size,
    required this.backPressed,
    required this.bagPressed,
    required this.userUniv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                backPressed();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Text(userUniv),
            IconButton(
              onPressed: () {
                bagPressed();
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
