import 'package:flutter/material.dart';
import 'package:mealacle/screens/BagScreen/components/food_basket_card.dart';
import '../../../controllers/database_controller.dart';
import '../../../models/food.dart';

class FoodInBasketArea extends StatefulWidget {
  const FoodInBasketArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DatabaseController controller;

  @override
  State<FoodInBasketArea> createState() => _FoodInBasketAreaState();
}

class _FoodInBasketAreaState extends State<FoodInBasketArea> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: widget.controller.getBasketList(),
      builder: (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text('장바구니가 텅 비었습니다!'),
          );
        } else {
          List<Food> foodLists = snapshot.data!;
          int i = 0;
          return ListView(
            children: foodLists.map((Food food) {
              int index = i;
              i++;
              return FoodBasketCard(
                removeFood: () async {
                  await widget.controller.removeFoodInBasketList(index);
                  setState(() {});
                },
                changeCount: (int count) async {
                  await widget.controller.changeFoodCount(index, count);
                  setState(() {});
                },
                food: food,
              );
            }).toList(),
          );
        }
      },
    );
  }
}
