import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/filter_designer_controller.dart';
import 'sub_bottom_sheet_top_area.dart';
import 'sub_bottom_sheet_shop_category_area.dart';

class SubBottomSheet extends StatefulWidget {
  final int index;
  final String title;
  final Function refreshFunction;
  const SubBottomSheet({
    Key? key,
    required this.index,
    required this.title,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  State<SubBottomSheet> createState() => _SubBottomSheetState();
}

class _SubBottomSheetState extends State<SubBottomSheet> {
  FilterDesignerController controller = FilterDesignerController.to;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SubBottomSheetTopArea(),
          Expanded(
            child: SubBottomSheetShopCategoryArea(
              refreshFunction: widget.refreshFunction,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: (){
                      controller.resetFilter();
                      widget.refreshFunction();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text('전체 초기화'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: (){
                      widget.refreshFunction();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: const Text('결과보기'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
