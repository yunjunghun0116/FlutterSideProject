import 'package:flutter/material.dart';
import '../../../constants.dart';

class ArtistScreenSelectCategoryContainer extends StatelessWidget {
  final String title;
  final int currentIndex;
  final int categoryIndex;
  final Function onPressed;
  const ArtistScreenSelectCategoryContainer({
    Key? key,
    required this.title,
    required this.currentIndex,
    required this.categoryIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: currentIndex == categoryIndex
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                )
              : null,
          child: Text(
            ' $title ',
            style: currentIndex == categoryIndex
                ? const TextStyle(
                    fontSize: 16,
                    color: kSelectedColor,
                    fontWeight: FontWeight.w600,
                  )
                : const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ),
    );
  }
}
