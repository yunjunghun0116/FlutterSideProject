import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealacle/screens/PurchaseScreen/purchase_screen.dart';
import 'bottom_bar_count_area.dart';
import 'bottom_bar_option_buttons.dart';
import 'bottom_bar_purchase_buttons.dart';
import '../../../constants.dart';
import '../../../models/food.dart';
import '../../../controllers/database_controller.dart';

class CustomPurchaseBottomBar extends StatefulWidget {
  final Food food;
  final bool isPurchaseClicked;
  final Function purchaseClickedFunction;
  final String foodPrice;
  const CustomPurchaseBottomBar({
    Key? key,
    required this.food,
    required this.isPurchaseClicked,
    required this.purchaseClickedFunction,
    required this.foodPrice,
  }) : super(key: key);

  @override
  State<CustomPurchaseBottomBar> createState() =>
      _CustomPurchaseBottomBarState();
}

class _CustomPurchaseBottomBarState extends State<CustomPurchaseBottomBar> {
  String optionPrice = "0";
  int optionIndex = 0;
  int foodCount = 1;

  final DatabaseController controller = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    final String resultPrice =
        ((int.parse(widget.foodPrice) + int.parse(optionPrice)) * foodCount)
            .toString();
    Size size = MediaQuery.of(context).size;
    return widget.isPurchaseClicked
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            width: double.infinity,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('옵션'),
                BottomBarOptionButtons(
                  options: widget.food.options,
                  onPressed: (int index, String price) {
                    setState(() {
                      optionIndex = index;
                      optionPrice = price;
                    });
                  },
                  optionIndex: optionIndex,
                  optionPrice: optionPrice,
                ),
                BottomBarCountArea(
                  resultPrice: resultPrice,
                  foodCount: foodCount,
                  minusClicked: () {
                    if (foodCount > 1) {
                      setState(() {
                        foodCount--;
                      });
                    }
                  },
                  addClicked: () {
                    setState(() {
                      foodCount++;
                    });
                  },
                ),
                BottomBarPurchaseButtons(
                  size: size,
                  addBagPressed: () async{
                    Map<String,dynamic> body = {
                      ...widget.food.toMap(),
                      'selectedOptionIndex':optionIndex,
                      'selectedOptionPrice':optionPrice,
                      'selectedCount':foodCount,
                    };
                    await controller.setFoodToBasket(Food.fromStorageMap(body));
                  },
                  purchasePressed: () async {
                    Map<String,dynamic> body = {
                      ...widget.food.toMap(),
                      'selectedOptionIndex':optionIndex,
                      'selectedOptionPrice':optionPrice,
                      'selectedCount':foodCount,
                    };
                    await controller.setFoodToBasket(Food.fromStorageMap(body));
                    Get.to(()=>const PurchaseScreen());
                  },
                ),
              ],
            ))
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            width: double.infinity,
            height: 80,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kSelectedColor),
              ),
              onPressed: () {
                widget.purchaseClickedFunction();
              },
              child: const Text('구매하기'),
            ),
          );
  }
}
