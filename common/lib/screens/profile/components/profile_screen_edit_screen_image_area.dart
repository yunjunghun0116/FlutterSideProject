import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenEditScreenImageArea extends StatelessWidget {
  final String imageUrl;
  final Function updateImage;
  const ProfileScreenEditScreenImageArea({
    Key? key,
    required this.imageUrl,
    required this.updateImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 150,
              height: 150,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) => Container(
                  width: 150,
                  height: 150,
                  color: kLightGreyColor,
                ),
                errorWidget: (context, url, error) => Icon(error),
              ),
            ),
            Positioned(
              bottom: 20,
              child: GestureDetector(
                onTap: () async {
                  await updateImage();
                },
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kBlackColorWithOpacity,
                  ),
                  height: 30,
                  child: const Text(
                    '편집',
                    style: TextStyle(color: kWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
