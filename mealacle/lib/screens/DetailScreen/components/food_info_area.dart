import 'package:flutter/material.dart';

class FoodInfoArea extends StatelessWidget {
  final String foodId;
  final String foodSeller;
  final String foodName;
  final String foodOrigin;
  const FoodInfoArea({
    Key? key, required this.foodId, required this.foodSeller, required this.foodName, required this.foodOrigin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('상품정보\n\n'),
          Text('상품번호 $foodId'),
          Text('제조사 $foodSeller'),
          Text('모델명 $foodName'),
          Text('원산지 $foodOrigin'),
        ],
      ),
    );
  }
}
