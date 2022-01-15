import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../constants.dart';

class FoodCard extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;
  final double foodPoint;
  final int pointVoter;

  const FoodCard({
    Key? key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.foodPoint,
    required this.pointVoter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: foodImage != ""
                  ? DecorationImage(
                      image: NetworkImage(foodImage),
                      fit: BoxFit.fill,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/images/no_image.png'),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$foodName\n',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '$foodPrice 원',
            style: const TextStyle(color: kSelectedColor),
          ),
          Row(
            children: [
              RatingBarIndicator(
                itemSize: 12,
                rating: foodPoint,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: kSelectedColor,
                ),
                itemCount: 5,
              ),
              Text(
                '(${pointVoter < 100 ? pointVoter : '99+'})',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
