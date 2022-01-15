import 'package:flutter/material.dart';
import '../../../models/food.dart';
import 'search_food_card.dart';

class SearchFoodArea extends StatelessWidget {
  final List<Food> foodList;
  const SearchFoodArea({
    Key? key,
    required this.foodList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: foodList.isNotEmpty
          ? foodList.map((food) {
              return SearchFoodCard(
                title: food.name,
                price: food.price,
                image: food.image.isNotEmpty ? food.image[0] : "",
                point: 4.5,
                pointVoter: 33,
                food: food,
              );
            }).toList()
          : [],
    );
  }
}
