import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  final Size size;
  final String userUniv;
  const CustomAppBar({Key? key, required this.size, required this.userUniv})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      decoration: const BoxDecoration(
        color: kBackgroundColor,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Text(userUniv),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: kTextColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: '메뉴를 검색하세요',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
