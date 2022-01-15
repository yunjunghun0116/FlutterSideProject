import 'package:flutter/material.dart';

class DetailScreenGatheringPlace extends StatelessWidget {
  const DetailScreenGatheringPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/location.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
