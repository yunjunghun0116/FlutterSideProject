import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/category_screen_filter_button.dart';
import '../upload/upload_screen.dart';
import '../../utils.dart';
import '../../constants.dart';
import '../../components/gathering_card.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _filterIndex = 0;
  List<Gathering> _gatheringList = [];

  @override
  void initState() {
    super.initState();
    GatheringController.to
        .setCategoryGatheringList(widget.category)
        .then((value) {
      setState(() {
        _gatheringList = GatheringController.to.categoryGatheringList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          widget.category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              CategoryScreenFilterButton(
                onPressed: (int index) {
                  setState(() {
                    _filterIndex = index;
                    _gatheringList = getListWithFilter(_gatheringList, index);
                  });
                },
                title: '마감순',
                currentIndex: _filterIndex,
                buttonIndex: 0,
              ),
              CategoryScreenFilterButton(
                onPressed: (int index) {
                  setState(() {
                    _filterIndex = index;
                    _gatheringList = getListWithFilter(_gatheringList, index);
                  });
                },
                title: '최신순',
                currentIndex: _filterIndex,
                buttonIndex: 1,
              ),
              CategoryScreenFilterButton(
                onPressed: (int index) {
                  setState(() {
                    _filterIndex = index;
                    _gatheringList = getListWithFilter(_gatheringList, index);
                  });
                },
                title: '인기 호스트 순',
                currentIndex: _filterIndex,
                buttonIndex: 2,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: _gatheringList.map((Gathering gathering) {
                    return GatheringCard(
                      gathering: gathering,
                      userName: gathering.host.name,
                      userImageUrl: gathering.host.imageUrl,
                      userJob: gathering.host.job,
                      gatheringTitle: gathering.title,
                      gatheringParticipant: gathering.participant,
                      gatheringCapacity: gathering.capacity,
                      gatheringOpenTime: gathering.openTime,
                      gatheringEndTime: gathering.endTime,
                      gatheringPlace: gathering.locationDetail,
                      gatheringTagList: gathering.tagList,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => UploadScreen(category: widget.category));
        },
        backgroundColor: kYellowColor,
        foregroundColor: kWhiteColor,
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
