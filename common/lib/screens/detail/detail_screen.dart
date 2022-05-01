import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/detail/components/detail_screen_over_bottom_bar.dart';
import 'package:common/screens/upload/upload_screen.dart';
import 'package:common/utils.dart';
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
  @override
  void initState() {
    super.initState();
    updateScreen();
  }

  Future<void> updateScreen() async {
    await UserController.to.currentUserUpdate(UserController.to.user!.id);
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
        actions: [
          widget.isHost
              ? InkWell(
                  onTap: () => Get.to(
                    () => UploadScreen(
                      category: widget.gathering.category,
                      gathering: widget.gathering,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: const Icon(Icons.edit),
                  ),
                )
              : InkWell(
                  onTap: () async {
                    await checkDialog(
                      title: '모임을 신고하시겠습니까?',
                      sureText: '신고하기',
                      onPressed: () async {
                        Get.back();
                        await GatheringController.to.reportGathering(
                          gatheringId: widget.gathering.id,
                          userId: UserController.to.user!.id,
                        );
                        await getDialog(title: '모임이 신고되었습니다');
                        Get.back();
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.report,
                      color: kRedColor,
                    ),
                  ),
                ),
        ],
      ),
      body: StreamBuilder(
        stream: GatheringController.to.getGatheringStream(widget.gathering.id),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            int currentStateIndex = 0;
            //0 : 일반
            //1 : 신청중
            //2 : 신청승인
            //3 : 취소요청
            Gathering gathering = Gathering.fromJson({
              'id': snapshot.data!.id,
              ...snapshot.data!.data() as Map<String, dynamic>,
            });
            if (gathering.applyList.indexWhere((element) =>
                    element.userId == UserController.to.user!.id) !=
                -1) {
              currentStateIndex = 1;
            } else if (gathering.cancelList.indexWhere((element) =>
                    element.userId == UserController.to.user!.id) !=
                -1) {
              currentStateIndex = 3;
            } else if (gathering.approvalList.indexWhere((element) =>
                    element.userId == UserController.to.user!.id) !=
                -1) {
              currentStateIndex = 2;
            }
            return Column(
              children: [
                widget.isHost || gathering.over
                    ? Container()
                    : currentStateIndex == 0
                        ? Container()
                        : UserGatheringStatus(
                            content: kDetailStateList[currentStateIndex]
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
                      gathering.tagList.isNotEmpty
                          ? DetailScreenGatheringHashTag(
                              tagList: gathering.tagList,
                            )
                          : Container(),
                    ],
                  ),
                ),
                gathering.over
                    ? const DetailScreenOverBottomBar()
                    : widget.isHost
                        ? DetailScreenHostBottomBar(
                            onPressed: () async {
                              GatheringController.to.expiredGathering(
                                gatheringId: gathering.id,
                                hostId: gathering.host.userId,
                              );
                            },
                            over: gathering.over,
                          )
                        : DetailScreenUserBottomBar(
                            applyPressed: () async {
                              await GatheringController.to
                                  .userApplyGathering(gathering.id);
                            },
                            cancelPressed: () async {
                              await GatheringController.to
                                  .userCancelGathering(gathering.id);
                            },
                            userStateIndex: currentStateIndex,
                          )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
