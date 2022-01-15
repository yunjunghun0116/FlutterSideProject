import 'package:flutter/material.dart';

class RecommendBottomSheetButton extends StatelessWidget {
  final String title;
  final int index;
  final Function onClicked;
  const RecommendBottomSheetButton({
    Key? key,
    required this.title,
    required this.index,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onClicked(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
