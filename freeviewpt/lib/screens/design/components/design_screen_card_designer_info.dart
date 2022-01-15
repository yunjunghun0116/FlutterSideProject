import 'package:flutter/material.dart';
import 'package:freeviewpt/constants.dart';
import 'package:get/get.dart';
import '../../artist/artist_screen.dart';
import '../../../models/designer.dart';

class DesignScreenCardDesignerInfo extends StatelessWidget {
  final Designer designer;
  const DesignScreenCardDesignerInfo({
    Key? key,
    required this.designer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => ArtistScreen(designer: designer));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(designer.imageUrl),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: designer.designerName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(text: ' | ${designer.shopName}'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: designer.shopAddress,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          kFollowButton,
        ],
      ),
    );
  }
}
