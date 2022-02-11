import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/detail/components/detail_screen_over_bottom_bar.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile/profile_screen.dart';
import '../applicants/applicants_screen.dart';
import '../../constants.dart';
import '../../models/gathering.dart';
import '../../components/user_info.dart';
import '../../components/user_gathering_status.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/user.dart';
import 'components/detail_screen_gathering_date_time.dart';
import 'components/detail_screen_gathering_info_card.dart';
import 'components/detail_screen_gathering_progress_bar.dart';
import 'components/detail_screen_user_bottom_bar.dart';
import 'components/detail_screen_gathering_hash_tag.dart';
import 'components/detail_screen_gathering_place_info.dart';
import 'components/detail_screen_gathering_applicants_check_button.dart';
import 'components/detail_screen_host_bottom_bar.dart';

class DetailScreen extends StatefulWidget {
  final Gathering gathering;
  final bool isHost;
  const DetailScreen({
    Key? key,
    required this.gathering,
    required this.isHost,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _userStateIndex = 0;

  @override
  void initState() {
    super.initState();
    updateScreen();
    checkUserStateIndex(UserController.to.user!.id);
  }

  Future<void> updateScreen() async {
    await UserController.to.currentUserUpdate(UserController.to.user!.id);
  }

  void checkUserStateIndex(String id) {
    for (int i = 0; i < widget.gathering.applyList.length; i++) {
      if (widget.gathering.applyList[i].userId == id) {
        setState(() {
          _userStateIndex = 1;
        });
        return;
      }
    }
    for (int i = 0; i < widget.gathering.cancelList.length; i++) {
      if (widget.gathering.cancelList[i].userId == id) {
        setState(() {
          _userStateIndex = 3;
        });
        return;
      }
    }
    for (int i = 0; i < widget.gathering.approvalList.length; i++) {
      if (widget.gathering.approvalList[i].userId == id) {
        setState(() {
          _userStateIndex = 2;
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1,
        title: Text(
          '${widget.gathering.host.name} 호스트',
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: GatheringController.to.getGatheringStream(widget.gathering.id),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Gathering gathering = Gathering.fromJson({
              'id': snapshot.data!.id,
              ...snapshot.data!.data() as Map<String, dynamic>,
            });
            return Column(
              children: [
                widget.isHost
                    ? Container()
                    : _userStateIndex == 0
                        ? Container()
                        : UserGatheringStatus(
                            content: kDetailStateList[_userStateIndex]
                                ['guideLine'],
                          ),
                Expanded(
                  child: ListView(
                    children: [
                      UserInfo(
                        userId: gathering.host.userId,
                        imageUrl: gathering.host.imageUrl,
                        name: gathering.host.name,
                        job: gathering.host.job,
                        hostTagList: gathering.host.userTagList,
                      ),
                      GestureDetector(
                        onTap: () async {
                          User user = await UserController.to
                              .getUser(gathering.host.userId);
                          Get.to(() => ProfileScreen(user: user));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            '상세보기',
                            style: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      ),
                      DetailScreenGatheringInfoCard(
                        title: '제목',
                        content: gathering.title,
                        icon: Icons.star,
                        iconColor: kYellowColor,
                      ),
                      DetailScreenGatheringInfoCard(
                        title: '카테고리',
                        content: gathering.category,
                        icon: Icons.category,
                      ),
                      DetailScreenGatheringProgressBar(
                        participantCount: gathering.approvalList.length,
                        capacity: gathering.capacity,
                      ),
                      widget.isHost
                          ? DetailScreenGatheringApplicantsCheckButton(
                              onPressed: () {
                                Get.to(() =>
                                    ApplicantsScreen(gathering: gathering));
                              },
                            )
                          : Container(),
                      DetailScreenGatheringDateTime(
                        openTime: gathering.openTime,
                        endTime: gathering.endTime,
                      ),
                      DetailScreenGatheringPlaceInfo(
                        location: gathering.location,
                        locationDetail: gathering.locationDetail,
                        hostMessage: gathering.hostMessage,
                      ),
                      DetailScreenGatheringHashTag(
                        tagList: gathering.tagList,
                      ),
                    ],
                  ),
                ),
                gathering.over
                    ? const DetailScreenOverBottomBar()
                    : widget.isHost
                        ? DetailScreenHostBottomBar(
                            onPressed: () async {
                              await GatheringController.to.updateGathering(
                                  gathering.id, {'over': true});
                            },
                            over: gathering.over,
                          )
                        : DetailScreenUserBottomBar(
                            applyPressed: () async {
                              await GatheringController.to
                                  .userApplyGathering(gathering.id);
                              setState(() {
                                _userStateIndex = 1;
                              });
                            },
                            cancelPressed: () async {
                              await GatheringController.to
                                  .userCancelGathering(gathering.id)
                                  .then((value) {
                                setState(() {
                                  _userStateIndex = 3;
                                });
                              });
                            },
                            userStateIndex: _userStateIndex,
                          )
              ],
            );
          }
          //TODO 데이터가 없을경우(사실상 이런경우없을듯)
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
