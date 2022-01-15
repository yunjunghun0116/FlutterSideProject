import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../artist/artist_screen.dart';
import '../../../models/designer.dart';
import '../../../constants.dart';

class UserScreenLikeDesignerCard extends StatelessWidget {
  final Designer designer;
  final bool isEditClicked;
  final bool isDesignerClicked;
  final Size size;
  final Function onPressed;
  const UserScreenLikeDesignerCard({
    Key? key,
    required this.designer,
    required this.isEditClicked,
    required this.isDesignerClicked,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDesignerClicked ? kUnSelectedColor : kWhiteColor,
        border: const Border(
          bottom: BorderSide(
            color: kUnSelectedColor,
          ),
        ),
      ),
      child: Row(
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
                            fontSize: size.width / 22,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text: ' | ${designer.shopName}',
                          style: TextStyle(
                            fontSize: size.width / 25,
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
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          isEditClicked
              ? GestureDetector(
                  onTap: () {
                    onPressed();
                  },
                  child: Container(
                    child: isDesignerClicked
                        ? const Icon(
                            Icons.check_box,
                            size: 30,
                          )
                        : const Icon(
                            Icons.check_box_outlined,
                            size: 30,
                          ),
                  ),
                )
              : kChatButton,
        ],
      ),
    );
  }
}
