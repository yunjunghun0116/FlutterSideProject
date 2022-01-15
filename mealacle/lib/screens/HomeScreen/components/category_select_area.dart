import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/food_controller.dart';
import '../../../constants.dart';

class CategorySelectArea extends StatelessWidget {
  final Function categorySelected;
  CategorySelectArea({
    Key? key,
    required this.categorySelected,
  }) : super(key: key);
  final controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 0),
      crossAxisCount: 5,
      childAspectRatio: 5 / 6,
      shrinkWrap: true,
      children: List.generate(kCategoryList.length, (index) {
        return InkWell(
          onTap: () async {
            await (controller
                .setFoodList(index))
                .then((value) => categorySelected());
          },
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kCategoryList[index][2]),
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: Text(
                    kCategoryList[index][1],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
