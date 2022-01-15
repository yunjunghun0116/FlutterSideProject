import 'package:flutter/material.dart';
import '../../../../controller/filter_designer_controller.dart';
import 'package:get/get.dart';
import 'recommend_bottom_sheet_button.dart';

class RecommendBottomSheet extends StatefulWidget {
  final String selectedTitle;
  final Function onClicked;
  const RecommendBottomSheet({
    Key? key,
    required this.selectedTitle,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<RecommendBottomSheet> createState() => _RecommendBottomSheetState();
}

class _RecommendBottomSheetState extends State<RecommendBottomSheet> {
  FilterDesignerController controller = FilterDesignerController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      child: Column(
        children: [
          RecommendBottomSheetButton(
              title: controller.getRecommendCategory(0),
              index: 0,
              onClicked: widget.onClicked),
          RecommendBottomSheetButton(
              title: controller.getRecommendCategory(1),
              index: 1,
              onClicked: widget.onClicked),
          RecommendBottomSheetButton(
              title: controller.getRecommendCategory(2),
              index: 2,
              onClicked: widget.onClicked),
          RecommendBottomSheetButton(
              title: controller.getRecommendCategory(3),
              index: 3,
              onClicked: widget.onClicked),
          RecommendBottomSheetButton(
              title: controller.getRecommendCategory(4),
              index: 4,
              onClicked: widget.onClicked),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.black),
                )),
                child: const Text('닫기'),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
