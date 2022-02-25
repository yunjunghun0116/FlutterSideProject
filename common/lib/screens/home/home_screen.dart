import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/location/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/home_screen_category_area.dart';
import 'components/home_screen_advertise_area.dart';
import '../../constants.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';
import '../../components/gathering_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
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
          onTap: () async {
            await Get.to(() => const LocationScreen(update: true));
            //setState해주는 이유 -> 의도적으로 화면을 한번 refresh해주어야하기때문에 : user의 데이터가 바뀌었으니까
            setState(() {});
          },
          child: GetBuilder<UserController>(
            builder: (context) {
              return Row(
                children: [
                  Text(
                    '${UserController.to.user!.city} ${UserController.to.user!.town}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
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
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
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
                      children: snapshot.data!.docs.map((e) {
                        Gathering gathering = Gathering.fromJson({
                          'id': e.id,
                          ...e.data() as Map<String, dynamic>,
                        });
                        if (DateTime.parse(gathering.openTime)
                                .difference(nowDate)
                                .inDays <
                            -5) {
                          GatheringController.to.expiredGathering(
                            gatheringId: gathering.id,
                            hostId: gathering.host.userId,
                          );
                        }
                        if (!gathering.reportedList
                                .contains(UserController.to.user!.id) &&
                            !UserController.to.user!.blockUser
                                .contains(gathering.host.userId)) {
                          return GatheringCard(gathering: gathering);
                        }
                        return Container();
                      }).toList(),
                    ),
                  ],
                );
              }
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: const Text(
                  '등록된 모임이 없네요ㅠㅠ\n새로 모임을 등록하고\n다양한 사람들과 만나보세요!!',
                  style: TextStyle(
                    fontSize: 16,
                    color: kGreyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
