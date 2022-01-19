import 'package:common/controllers/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/home_screen_category_area.dart';
import 'components/home_screen_advertise_area.dart';
import '../university/university_screen.dart';
import '../../constants.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';
import '../../components/gathering_card.dart';

class HomeScreen extends StatefulWidget {
  final String university;
  const HomeScreen({
    Key? key,
    required this.university,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _getGatheringCard(List<Gathering> list) {
    GatheringController.to.setGatheringList();
    return Column(
      children: list.map((Gathering gathering) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: GestureDetector(
          onTap: () {
            Get.to(() => const UniversityScreen());
          },
          child: GetBuilder<DatabaseController>(
            builder: (context){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(DatabaseController.to.user!.university),
                      const SizedBox(width: 5),
                      const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              );
            },

          ),
        ),
      ),
      body: ListView(
        children: [
          const HomeScreenAdvertiseArea(),
          const HomeScreenCategoryArea(),
          const Divider(thickness: 2),
          GetBuilder<GatheringController>(
           builder:(context){
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   child: Text(
                     '최근 올라온 모임을 소개해드릴게요!!',
                     style: TextStyle(
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
                 _getGatheringCard(GatheringController.to.gatheringList),
               ],
             );
           }
          ),
        ],
      ),
    );
  }
}
