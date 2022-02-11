import 'package:common/controllers/gathering_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/category_screen.dart';
import '../../../constants.dart';

class HomeScreenCategoryArea extends StatelessWidget {
  const HomeScreenCategoryArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 5,
      children: kCategoryList.map((Map<String, dynamic> category) {
        return InkWell(
          onTap: () {
            Get.to(() => CategoryScreen(category: category['title']));
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category['icon'],
                  color: kDarkGreyColor,
                ),
                Text(
                  category['title'],
                  style: const TextStyle(
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
