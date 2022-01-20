import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../upload/upload_screen.dart';
import '../../constants.dart';
import '../../components/gathering_card.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

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
          category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<GatheringController>(builder: (context) {
        return ListView(
          children: [
            Column(
              children: GatheringController.to.categoryGatheringList
                  .map((Gathering gathering) {
                return GatheringCard(
                  gathering: gathering,
                  userName: gathering.host.name,
                  userImageUrl: gathering.host.imageUrl,
                  userJob: gathering.host.job,
                  gatheringTitle: gathering.title,
                  gatheringParticipant: gathering.approvalList.length,
                  gatheringCapacity: gathering.capacity,
                  gatheringOpenTime: gathering.openTime,
                  gatheringEndTime: gathering.endTime,
                  gatheringPlace: gathering.locationDetail,
                  gatheringTagList: gathering.tagList,
                );
              }).toList(),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => UploadScreen(category: category));
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
