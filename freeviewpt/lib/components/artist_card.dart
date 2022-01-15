import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/designer.dart';
import '../screens/artist/artist_screen.dart';
import '../../constants.dart';

class ArtistCard extends StatefulWidget {
  final Designer designer;
  final String imageUrl;
  final String designerName;
  final String shopName;
  final String shopAddress;
  final int portfolioCount;
  final int viewCount;
  final int likeCount;
  final List designList;
  final bool isPicked;
  const ArtistCard({
    Key? key,
    required this.designer,
    required this.imageUrl,
    required this.designerName,
    required this.shopName,
    required this.shopAddress,
    required this.portfolioCount,
    required this.viewCount,
    required this.likeCount,
    required this.designList,
    this.isPicked = false,
  }) : super(key: key);

  @override
  State<ArtistCard> createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  bool isPicked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isPicked = widget.isPicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => ArtistScreen(designer: widget.designer));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ArtistScreen(designer: widget.designer));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                        children: [
                          TextSpan(
                            text: widget.designerName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(text: ' | ${widget.shopName}'),
                        ],
                      ),
                    ),
                    Text(
                      widget.shopAddress,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black26,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                        children: [
                          TextSpan(text: '포트폴리오(${widget.portfolioCount})'),
                          TextSpan(
                            text: ' | 조회수(${widget.viewCount})',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPicked = !isPicked;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: kFollowButton,
              ),
            ),
          ],
        ),
        widget.designList.isNotEmpty
            ? SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        children: widget.designList.map((e) {
                      return Container(
                        margin: const EdgeInsets.all(2),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fill,
                        )),
                      );
                    }).toList()),
                  ),
                ),
              )
            : Container(),
        const Divider(),
      ],
    );
  }
}
