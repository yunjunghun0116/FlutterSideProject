import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodImageArea extends StatelessWidget {
  final Size size;
  final List foodImage;
  const FoodImageArea({
    Key? key,
    required this.size,
    required this.foodImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      width: double.infinity,
      child: foodImage.isNotEmpty
          ? CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
              ),
              items: foodImage.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            )
          : Image.asset(
              'assets/images/no_image.png',
              fit: BoxFit.fill,
            ),
    );
  }
}
