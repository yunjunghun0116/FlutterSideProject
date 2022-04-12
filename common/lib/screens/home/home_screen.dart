import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/location/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/home_screen_category_area.dart';
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
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '어떤 모임에\n참여해볼까요?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Icon(
                      //     Icons.settings_outlined,
                      //     color: kDarkGreyColor,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Get.to(() => const LocationScreen(update: true));
                    //setState해주는 이유 -> 의도적으로 화면을 한번 refresh해주어야하기때문에 : user의 데이터가 바뀌었으니까
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kLightGreyColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.near_me),
                        const SizedBox(width: 6),
                        GetBuilder<UserController>(
                          builder: (context) {
                            return Text(
                              '${UserController.to.user!.city} ${UserController.to.user!.town}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,color: kGreyColor,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HomeScreenCategoryArea(),
          StreamBuilder(
            stream: GatheringController.to.getGatheringListStream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '모든 모임',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 4/3,
                          color: kMainColor,
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
                padding: const EdgeInsets.symmetric(vertical: 40),
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
