import 'package:flutter/material.dart';
import '../screens/design/design_screen.dart';
import 'package:get/get.dart';

class ArtistNailCard extends StatelessWidget {
  final String designerName;
  final String imageUrl;
  final String shopAddress;
  final bool isBig;
  final bool isImageOnly;
  const ArtistNailCard({
    Key? key,
    required this.designerName,
    required this.shopAddress,
    required this.imageUrl,
    this.isBig = false,
    this.isImageOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => const DesignScreen());
      },
      child: Container(
        width: isBig ? width / 2.5 : width / 3,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: isBig ? width / 2.5 : width / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                alignment: Alignment.bottomRight,
                child: const Icon(Icons.favorite_outline,
                    color: Colors.red, size: 25),
              ),
            ),
            isImageOnly
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '36,000원',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        designerName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        shopAddress,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
