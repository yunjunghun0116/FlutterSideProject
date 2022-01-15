import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertisementArea extends StatelessWidget {
  const AdvertisementArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: [
        'assets/advertisement/hanburger1.jpeg',
        'assets/advertisement/sandwich1.jpeg',
        'assets/advertisement/steak1.jpeg'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(i),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
