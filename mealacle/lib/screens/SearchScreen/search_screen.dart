import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/category_select_top_area.dart';
import 'components/order_select_area.dart';
import 'components/search_food_area.dart';
import 'components/top_app_bar.dart';
import '../../constants.dart';
import '../../controllers/food_controller.dart';

//stateful로 한 이유는 기본순/별점순/가격높은순 등등 가져온 자료를 위주로 필터링해주어야하기때문
class SearchScreen extends StatefulWidget {
  final String userUniv;
  final Function backPressed;
  final Function bagPressed;
  final int startIndex;
  const SearchScreen(
      {Key? key,
      required this.userUniv,
      required this.backPressed,
      required this.bagPressed,
      this.startIndex = 0})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedCategoryIndex = 0;
  int _selectedOrderIndex = 0;
  final controller = Get.put(FoodController());
  @override
  void initState() {
    super.initState();
    controller.setFoodList(0).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TopAppBar(
            size: size,
            backPressed: widget.backPressed,
            bagPressed: widget.bagPressed,
            userUniv: widget.userUniv,
          ),
          CategorySelectTopArea(
            selectedCategoryIndex: _selectedCategoryIndex,
            onPressed: (int index) async {
              await controller.setFoodList(index);
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),
          kDivider(1),
          OrderSelectArea(
            size: size,
            selectedOrderIndex: _selectedOrderIndex,
            changeOrder: (int index) {
              setState(() {
                _selectedOrderIndex = index;
              });
            },
          ),
          SearchFoodArea(foodList: controller.foodList),
        ],
      ),
    );
  }
}
