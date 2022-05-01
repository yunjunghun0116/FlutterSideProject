import 'package:flutter/material.dart';
import '../../../constants.dart';

class CategoryScreenFilterButton extends StatelessWidget {
  final String title;
  final int currentIndex;
  final int buttonIndex;
  final Function onPressed;
  const CategoryScreenFilterButton({
    Key? key,
    required this.title,
    required this.currentIndex,
    required this.buttonIndex, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed(buttonIndex);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: currentIndex == buttonIndex ? kMainColor:null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: currentIndex == buttonIndex?kWhiteColor:kGreyColor, fontSize: 20),
        ),
      ),
    );
  }
}
