import 'package:flutter/material.dart';

class UserInfoArea extends StatelessWidget {
  const UserInfoArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Text(
            '?',
            style: TextStyle(
              fontSize: 70,
            ),
          ),
        ),
        const Text(
          '로그인을 해주세요',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
