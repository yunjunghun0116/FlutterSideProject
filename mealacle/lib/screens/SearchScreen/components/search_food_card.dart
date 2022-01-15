import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../DetailScreen/detail_screen.dart';
import '../../../models/food.dart';
import '../../../constants.dart';

class SearchFoodCard extends StatelessWidget {
  final Food food;
  final String image;
  final String title;
  final String price;
  final double point;
  final int pointVoter;
  const SearchFoodCard({
    Key? key,
    this.image = "",
    required this.title,
    required this.price,
    required this.point,
    required this.pointVoter,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DetailScreen(), arguments: food);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: image != ""
                ? DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.fitWidth,
                  )
                : const DecorationImage(
                    image: AssetImage(
                      'assets/images/no_image.png',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 10,
                color: kTextfieldBackgroundColor,
              ),
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: MediaQuery.of(context).size.height * 0.08,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${kPriceComma(price)} 원'),
                  Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: 20,
                        rating: point,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: kSelectedColor,
                        ),
                        itemCount: 5,
                      ),
                      Text(
                        '(${pointVoter < 100 ? pointVoter : '99+'})',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
