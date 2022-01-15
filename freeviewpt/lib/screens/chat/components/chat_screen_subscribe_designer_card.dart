import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../artist/artist_screen.dart';
import '../../../models/designer.dart';

class ChatScreenSubscribeDesignerCard extends StatelessWidget {
  final Designer designer;
  const ChatScreenSubscribeDesignerCard({
    Key? key,
    required this.designer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double nameTitleSize = size.width / 22;
    double subTitleSize = size.width / 25;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => ArtistScreen(designer: designer));
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(designer.imageUrl),
            radius: size.width / 15,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: [
                    TextSpan(
                        text: designer.designerName,
                        style: TextStyle(
                          fontSize: nameTitleSize,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(
                        text: ' | ${designer.shopName}',
                        style: TextStyle(
                          fontSize: subTitleSize,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                designer.shopAddress,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width / 30,
                ),
              ),
              Text(
                '포트폴리오 (${designer.portfolioCount}) | 조회수 (${designer.viewCount}) | 찜수 (${designer.likeCount})',
                style: const TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
