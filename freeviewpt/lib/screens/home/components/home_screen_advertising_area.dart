import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeScreenAdvertisingArea extends StatelessWidget {
  const HomeScreenAdvertisingArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width*0.7,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: kAdvertisementImageList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(i),
                  fit: BoxFit.fill
                ),
              ),

            );
          },
        );
      }).toList(),
    );
  }
}
