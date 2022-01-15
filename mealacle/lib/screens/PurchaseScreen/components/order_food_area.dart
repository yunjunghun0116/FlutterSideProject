import 'package:flutter/material.dart';
import '../../../models/food.dart';
import '../../../constants.dart';

class OrderFoodArea extends StatelessWidget {
  final List<Food> orderList;
  const OrderFoodArea({Key? key, required this.orderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: kTextfieldBackgroundColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '주문 정보',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            children: orderList.map((Food food) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${food.name}(x${food.selectedCount})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('- 기본가(${kPriceComma(food.price)}원)'),
                    Text(
                        '- 옵션${(food.selectedOptionIndex ?? 0) + 1} (추가 ${kPriceComma(food.selectedOptionPrice ?? '0')}원)'),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
