import 'package:flutter/material.dart';
import 'home_screen_filtering_button.dart';

class HomeScreenFilteringButtonArea extends StatelessWidget {
  final String recommendTitle;
  final String shopCategoryTitle;
  final Function refreshFunction;
  const HomeScreenFilteringButtonArea({
    Key? key,
    required this.recommendTitle,
    required this.shopCategoryTitle,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //앱바의 크기에 맞게 지정
      height: AppBar().preferredSize.height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            HomeScreenFilteringButton(
              checkIndex: 0,
              title: recommendTitle,
              refreshFunction: refreshFunction,
            ),
            HomeScreenFilteringButton(
              checkIndex: 2,
              title: shopCategoryTitle,
              refreshFunction: refreshFunction,
            ),
          ],
        ),
      ),
    );
  }
}
