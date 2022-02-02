import 'package:flutter/material.dart';
import '../../../components/bottomsheets/recommend_bottom_sheet.dart';
import '../../../components/rounded_button.dart';
import '../../../controller/filter_designer_controller.dart';
import 'package:get/get.dart';

class CategoryScreenAppBarFilterArea extends StatelessWidget {
  final Function refreshFunction;
  CategoryScreenAppBarFilterArea({Key? key, required this.refreshFunction,}) : super(key: key);

  final FilterDesignerController _filterDesignerController =
      FilterDesignerController.to;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.bottomSheet(RecommendBottomSheet(
                selectedTitle: _filterDesignerController.filteredRecommend,
                onClicked: (int index) {
                  _filterDesignerController.updateRecommendFilter(index);
                  Get.back();
                  refreshFunction();
                },
              ));
            },
            child: RoundedButton(
              title: _filterDesignerController.filteredRecommend,
            ),
          ),
          const RoundedButton(title: '거리'),
          const RoundedButton(title: '스타일'),
          const RoundedButton(title: '가격'),
          const RoundedButton(title: '색상'),

        ],
      ),
    );
  }
}
