import 'package:flutter/material.dart';
import '../../../models/food.dart';
import '../../../constants.dart';

class OrderPriceArea extends StatelessWidget {
  final List<Food> orderList;
  final int allFoodPrice;
  final int discountPrice;
  const OrderPriceArea({
    Key? key,
    required this.orderList,
    required this.allFoodPrice,
    required this.discountPrice ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int resultPrice = allFoodPrice - discountPrice;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(color: kTextfieldBackgroundColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '결제금액',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('주문 금액'),
              Text('${kPriceComma(allFoodPrice.toString())} 원')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('할인 금액'),
              Text(' - ${kPriceComma(discountPrice.toString())} 원')
            ],
          ),
          kDivider(1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('총 금액'),
              Text('${kPriceComma(resultPrice.toString())} 원')
            ],
          ),
        ],
      ),
    );
  }
}
