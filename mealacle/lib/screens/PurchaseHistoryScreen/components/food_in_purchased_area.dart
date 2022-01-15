import 'package:flutter/material.dart';
import '../../../controllers/database_controller.dart';
import '../../../models/food.dart';
import 'food_purchased_card.dart';

class FoodInPurchasedArea extends StatelessWidget {
  FoodInPurchasedArea({Key? key}) : super(key: key);
  final DatabaseController controller = DatabaseController.to;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: controller.getPurchasedList(),
      builder: (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text('주문내역이 없습니다!'),
          );
        } else {
          List<Food> foodLists = snapshot.data!;
          return ListView(
            children: foodLists.map((Food food) {
              return FoodPurchasedCard(food: food);
            }).toList(),
          );
        }
      },
    );
  }
}
