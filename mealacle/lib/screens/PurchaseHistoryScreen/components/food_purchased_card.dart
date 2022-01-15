import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../DetailScreen/detail_screen.dart';
import '../../../models/food.dart';
import '../../../constants.dart';

class FoodPurchasedCard extends StatelessWidget {
  final Food food;
  const FoodPurchasedCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: kTextfieldBackgroundColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  '주문일자 ${(food.storedTime ?? DateTime.now().toString()).substring(0, 10)}'),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(food.image[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('상품번호 ${food.id}\n'),
                      Text(
                          '${kPriceComma(food.price)}원(+${kPriceComma(food.selectedOptionPrice ?? '0')}원) ${food.selectedCount}개'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const DetailScreen(), arguments: food);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('제품 보러가기'),
            ),
          ),
        ],
      ),
    );
  }
}
