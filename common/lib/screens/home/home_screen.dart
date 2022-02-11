import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
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
  DateTime nowDate = DateTime.now();

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
          child: GetBuilder<UserController>(
            builder: (context) {
              return Row(
                children: [
                  Text(UserController.to.user!.university),
                  const SizedBox(width: 5),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
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
          StreamBuilder(
            stream: GatheringController.to.getGatheringListStream(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData){
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
                    Column(
                      children: snapshot.data!.docs.map((e){
                        Gathering gathering = Gathering.fromJson({
                          'id':e.id,
                          ...e.data() as Map<String,dynamic>
                        });
                        if (DateTime.parse(gathering.openTime).difference(nowDate).inDays < -5) {
                          GatheringController.to.updateGathering(e.id, {'over': true});
                        }
                        return GatheringCard(gathering: gathering);
                      }).toList(),
                    ),
                  ],
                );
              }
              //TODO 데이터가 없을경우에 보여줄 데이터
              return CircularProgressIndicator();
            },
          ),
          // GetBuilder<GatheringController>(
          //  builder:(context){
          //    return Column(
          //      crossAxisAlignment: CrossAxisAlignment.start,
          //      children: [
          //        Row(
          //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //          children: [
          //            const Padding(
          //              padding: EdgeInsets.symmetric(horizontal: 10),
          //              child: Text(
          //                '최근 올라온 모임을 소개해드릴게요!!',
          //                style: TextStyle(
          //                  fontWeight: FontWeight.w600,
          //                ),
          //              ),
          //            ),
          //            GestureDetector(
          //              onTap: (){
          //                GatheringController.to.setGatheringList();
          //              },
          //              child: Container(
          //                padding: const EdgeInsets.all(5),
          //                child: const Icon(Icons.refresh,color: kDarkGreyColor,),
          //              ),
          //            ),
          //          ],
          //        ),
          //        _getGatheringCard(),
          //      ],
          //    );
          //  }
          // ),
        ],
      ),
    );
  }
}
