import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../constants.dart';

class FoodTitleArea extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  final double foodPoint;
  final int pointVoter;
  const FoodTitleArea({
    Key? key,
    required this.foodName,
    required this.foodPrice,
    required this.foodPoint,
    required this.pointVoter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RatingBarIndicator(
                itemSize: 20,
                rating: foodPoint,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: kSelectedColor,
                ),
                itemCount: 5,
              ),
              Text(
                '(${pointVoter < 100 ? pointVoter : '99+'})',
                style: const TextStyle(
                    fontSize: 15, color: kTextfieldBackgroundColor),
              ),
            ],
          ),
          Text(
            foodName,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${kPriceComma(foodPrice)} 원',
            style: const TextStyle(color: kSelectedColor),
          ),
        ],
      ),
    );
  }
}
