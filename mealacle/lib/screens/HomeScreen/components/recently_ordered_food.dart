import 'package:flutter/material.dart';
import 'food_card.dart';

class RecentlyOrderedFood extends StatelessWidget {
  const RecentlyOrderedFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            FoodCard(
              foodImage:
              'https://firebasestorage.googleapis.com/v0/b/mealacle-7cb03.appspot.com/o/images%2F12zo3Xtyl6YpfKWQGal2%2F1?alt=media&token=68096389-4474-4ee1-ba9f-8ad33f52f5f9',
              foodName: '프렌치 스테이크프렌치 스테이크프렌치 스테이크',
              foodPrice: '19,000',
              foodPoint: 3.8,
              pointVoter: 20,
            ),
          ],
        ),
      ),
    );
  }
}

