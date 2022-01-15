import 'package:flutter/material.dart';

class ArtistScreenGoogleMapArea extends StatelessWidget {
  const ArtistScreenGoogleMapArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/map_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}
