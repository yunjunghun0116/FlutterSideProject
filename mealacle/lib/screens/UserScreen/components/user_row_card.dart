import 'package:flutter/material.dart';

class UserRowCard extends StatelessWidget {
  final String title;
  final Function onClicked;
  const UserRowCard({
    Key? key,
    required this.title, required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
            onPressed: () {
              onClicked();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
