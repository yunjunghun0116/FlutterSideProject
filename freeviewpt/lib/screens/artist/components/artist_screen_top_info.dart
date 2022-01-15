import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/designer.dart';

class ArtistScreenTopInfo extends StatelessWidget {
  final Designer designer;
  const ArtistScreenTopInfo({Key? key, required this.designer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(designer.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            kGetCountString(designer.viewCount),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Text('조회수'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            kGetCountString(designer.portfolioCount),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Text('포트폴리오'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            kGetCountString(designer.likeCount),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Text('구독자'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //TODO portfolio link
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: designer.designerName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' | ${designer.shopName}',
                        ),
                      ],
                    ),
                  ),
                  Text(designer.shopAddress),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: const Text(
                  '상세보기',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kUnSelectedColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/instagram_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '구독하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
