import 'package:flutter/material.dart';
import '../../../constants.dart';

class UnivTextFieldArea extends StatelessWidget {
  final bool selectedTown;
  const UnivTextFieldArea({Key? key, required this.selectedTown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: kTextfieldBackgroundColor),
        borderRadius: BorderRadius.circular(30),
        color: selectedTown
            ? Colors.white24
            : kTextfieldBackgroundColor.withOpacity(0.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.search),
          hintText: selectedTown ? '학교를 입력해주세요' : '지역을 선택해주세요',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
