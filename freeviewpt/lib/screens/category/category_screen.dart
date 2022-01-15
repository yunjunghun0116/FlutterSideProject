import 'package:flutter/material.dart';
import 'components/category_screen_different_design_title.dart';
import 'components/category_screen_app_bar.dart';
import 'components/category_screen_different_design_nail.dart';
import 'components/category_screen_month_special_nail.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isImageOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CategoryScreenAppBar(
            refreshFunction: () {
              setState(() {});
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CategoryScreenMonthSpecialNail(),
                        CategoryScreenDifferentDesignTitle(
                          isImageOnly: isImageOnly,
                          onClicked: () {
                            setState(() {
                              isImageOnly = !isImageOnly;
                            });
                          },
                        ),
                        CategoryScreenDifferentDesignNail(
                          isImageOnly: isImageOnly,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
