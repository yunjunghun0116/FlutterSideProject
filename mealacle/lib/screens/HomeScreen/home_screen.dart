import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/custom_app_bar.dart';
import 'components/advertisement_area.dart';
import 'components/category_select_area.dart';
import 'components/company_explanation_text_area.dart';
import 'components/recently_ordered_food.dart';
import 'components/recently_viewed_food.dart';
import 'components/title_text_area.dart';

class HomeScreen extends StatelessWidget {
  final String userUniv;
  final Function categorySelected;
  const HomeScreen(
      {Key? key, required this.userUniv, required this.categorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(size: size, userUniv: userUniv),
          const AdvertisementArea(),
          CategorySelectArea(categorySelected: categorySelected),
          const TitleTextArea(title: '최근 본 상품'),
          const RecentlyViewedFood(),
          const TitleTextArea(title: '최근 주문한 상품'),
          const RecentlyOrderedFood(),
          kDivider(1),
          const CompanyExplanationTextArea(),
        ],
      ),
    );
  }
}
