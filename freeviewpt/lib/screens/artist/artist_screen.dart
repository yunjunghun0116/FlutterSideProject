import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../components/artist_nail_card.dart';
import '../../../components/rounded_button.dart';
import '../../../models/designer.dart';
import 'components/artist_screen_bottom_bar.dart';
import 'components/artist_screen_month_special_nail.dart';
import 'components/artist_screen_shop_info.dart';
import 'components/artist_screen_top_info.dart';
import 'components/artist_screen_google_map_area.dart';
import 'components/artist_screen_select_category_container.dart';
import 'components/artist_screen_select_info_button.dart';

class ArtistScreen extends StatefulWidget {
  final Designer designer;
  const ArtistScreen({
    Key? key,
    required this.designer,
  }) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  bool isImageOnly = false;
  int _currentSelectIndex = 0;

  Widget getGridDesignerList(List<String> list) {
    List<Row> _outputList = [];
    List<ArtistNailCard> _nailCardList = [];
    for (int i = 0; i < list.length; i++) {
      if (i % 3 == 0) {
        _outputList.add(Row(children: _nailCardList.toList()));
        _nailCardList.clear();
      }
      _nailCardList.add(
        ArtistNailCard(
          designerName: widget.designer.designerName,
          shopAddress: widget.designer.shopAddress,
          imageUrl: list[i],
          isImageOnly: isImageOnly,
        ),
      );
    }
    if (_nailCardList.isNotEmpty) {
      _outputList.add(Row(children: _nailCardList.toList()));
    }
    return Column(
      children: _outputList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            Text(
              widget.designer.designerName,
              style: const TextStyle(
                color: kSelectedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          children: [
            //DesignerInfo
            ArtistScreenTopInfo(designer: widget.designer),
            //ShopInfo
            Column(
              children: [
                const ArtistScreenGoogleMapArea(),
                ArtistScreenShopInfo(designer: widget.designer),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ArtistScreenSelectInfoButton(
                          icon: Icons.card_giftcard,
                          onPressed: () {},
                          title: '이벤트',
                        ),
                        ArtistScreenSelectInfoButton(
                          icon: Icons.alarm,
                          onPressed: () {},
                          title: '예약표',
                        ),
                        ArtistScreenSelectInfoButton(
                          icon: Icons.event_note,
                          onPressed: () {},
                          title: '예약방법',
                        ),
                        ArtistScreenSelectInfoButton(
                          icon: Icons.dashboard_rounded,
                          onPressed: () {},
                          title: '가격표',
                        ),
                        ArtistScreenSelectInfoButton(
                          icon: Icons.local_taxi,
                          onPressed: () {},
                          title: '주차방법',
                        ),
                        ArtistScreenSelectInfoButton(
                          icon: Icons.add,
                          onPressed: () {},
                          title: '',
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(color: Colors.black26, thickness: 2),
              ],
            ),
            //FilterArea
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  ArtistScreenSelectCategoryContainer(
                    title: '네일',
                    currentIndex: _currentSelectIndex,
                    categoryIndex: 0,
                    onPressed: () {
                      setState(() {
                        _currentSelectIndex = 0;
                      });
                    },
                  ),
                  ArtistScreenSelectCategoryContainer(
                    title: '페디',
                    currentIndex: _currentSelectIndex,
                    categoryIndex: 1,
                    onPressed: () {
                      setState(() {
                        _currentSelectIndex = 1;
                      });
                    },
                  ),
                  ArtistScreenSelectCategoryContainer(
                    title: '케어',
                    currentIndex: _currentSelectIndex,
                    categoryIndex: 2,
                    onPressed: () {
                      setState(() {
                        _currentSelectIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  RoundedButton(title: '추천순'),
                  RoundedButton(title: '스타일'),
                  RoundedButton(title: '가격'),
                  RoundedButton(title: '색상'),
                ],
              ),
            ),
            //DesignerNailArea
            ArtistScreenMonthSpecialNail(designer: widget.designer),
            const Divider(color: Colors.black26, thickness: 2),
            Padding(
              padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '네일 디자인',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('사진만 보기'),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isImageOnly = !isImageOnly;
                          });
                        },
                        child: isImageOnly
                            ? const Icon(Icons.check_box_rounded)
                            : const Icon(Icons.check_box_outline_blank),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            getGridDesignerList(widget.designer.designList),
          ],
        ),
      ),
      bottomNavigationBar: ArtistScreenBottomBar(designer: widget.designer),
    );
  }
}
