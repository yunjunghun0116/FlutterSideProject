import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/filter_designer_controller.dart';
import '../../../components/BottomSheets/sub_bottom_sheet.dart';
import '../../../components/BottomSheets/recommend_bottom_sheet.dart';

class HomeScreenFilteringButton extends StatelessWidget {
  final String title;
  final int checkIndex;
  final Function refreshFunction;
  const HomeScreenFilteringButton({
    Key? key,
    required this.title,
    required this.checkIndex,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterDesignerController controller = FilterDesignerController.to;
    return GestureDetector(
      onTap: () {
        if (checkIndex == 0) {
          Get.bottomSheet(RecommendBottomSheet(
            selectedTitle: title,
            onClicked: (int index) {
              controller.updateRecommendFilter(index);
              Get.back();
              refreshFunction();
            },
          ));
        } else if (checkIndex == 1 || checkIndex == 2) {
          Get.bottomSheet(SubBottomSheet(
            index: checkIndex,
            title: title, //xkm이내
            refreshFunction: refreshFunction,
          ));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
