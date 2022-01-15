import 'package:flutter/material.dart';
import 'package:mealacle/models/food.dart';

import '../../../constants.dart';

class FoodBasketCard extends StatefulWidget {
  final Function removeFood;
  final Function changeCount;
  final Food food;
  const FoodBasketCard({
    Key? key,
    required this.food,
    required this.removeFood,
    required this.changeCount,
  }) : super(key: key);

  @override
  _FoodBasketCardState createState() => _FoodBasketCardState();
}

class _FoodBasketCardState extends State<FoodBasketCard> {
  String resultPrice = "";
  String selectedPrice = "";
  int foodCount = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      foodCount = widget.food.selectedCount ?? 1;
      selectedPrice = (int.parse(widget.food.price) +
              int.parse(widget.food.selectedOptionPrice ?? '0'))
          .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    resultPrice = (int.parse(selectedPrice) * foodCount).toString();
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: kTextfieldBackgroundColor,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.food.name),
              IconButton(
                onPressed: () async{
                  await widget.removeFood();
                },
                icon: const Icon(Icons.clear),
              ),
            ],
          ),
          Text('- 기본가 (${kPriceComma(widget.food.price)} 원)'),
          Text(
              '- 옵션 ${(widget.food.selectedOptionIndex??0)+1} (추가 ${widget.food.selectedOptionPrice}원) '),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: 70,
                height: 70,
                child: Image.network(
                  widget.food.image[0],
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('상품번호 ${widget.food.id}'),
                  Text('제조사 ${widget.food.sellerName}'),
                  Text('총 가격: ${kPriceComma(resultPrice)}원'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (foodCount > 1) {
                          setState(()  {
                            foodCount--;
                          });
                          await widget.changeCount(foodCount);
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$foodCount'),
                    IconButton(
                      onPressed: ()async {
                        setState(() {
                          foodCount++;
                        });
                        await widget.changeCount(foodCount);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
