import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/designer_controller.dart';
import '../../../constants.dart';

class UserScreenLikeDesign extends StatelessWidget {
  UserScreenLikeDesign({Key? key}) : super(key: key);
  final DesignerController _designerController = DesignerController.to;
  Widget getLikeContainer(String likeName, List<String> imageList) {
    List<Widget> _likeImageList = [];
    for (int i = 0; i < 4; i++) {
      if (i < imageList.length) {
        _likeImageList.add(Image.asset(imageList[i]));
      } else {
        _likeImageList.add(Container());
      }
    }
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: _likeImageList,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                likeName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kSelectedColor,
          ),
        ),
        title: const Text(
          '디자인 찜',
          style: TextStyle(
            color: kSelectedColor,
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 10),
            child: const Text(
              '수정',
              style: TextStyle(
                color: kBlueColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              '디자인 찜 그룹',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GridView.count(
//TODO Scrollphysics에 대해서 공부하기
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 4 / 5,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            children: [
              getLikeContainer(
                  '전체 찜', _designerController.designerList[1].designList),
              getLikeContainer('가을에 어울리는 네일아트',
                  _designerController.designerList[2].designList),
              getLikeContainer('겨울에 어울리는 네일아트',
                  _designerController.designerList[3].designList),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
