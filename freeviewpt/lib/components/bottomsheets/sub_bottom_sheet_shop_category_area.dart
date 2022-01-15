import 'package:flutter/material.dart';
import '../../../../controller/filter_designer_controller.dart';

class SubBottomSheetShopCategoryArea extends StatefulWidget {
  final Function refreshFunction;
  const SubBottomSheetShopCategoryArea({
    Key? key,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  State<SubBottomSheetShopCategoryArea> createState() =>
      _SubBottomSheetShopCategoryAreaState();
}

class _SubBottomSheetShopCategoryAreaState
    extends State<SubBottomSheetShopCategoryArea> {
  @override
  Widget build(BuildContext context) {
    FilterDesignerController controller = FilterDesignerController.to;
    int i = 0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('샵 정보'),
              Row(children: const [
                Icon(Icons.update),
                Text('샵 정보 초기화'),
              ])
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              childAspectRatio: 3,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: controller.kShopCategoryList.map((String e) {
                int currentIndex = i++;
                return GestureDetector(
                  onTap: () {
                    controller.updateShopCategoryFilter(currentIndex);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: e == controller.filteredShopCategory
                          ? Colors.amber
                          : Colors.white,
                    ),
                    child: Text(e),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
