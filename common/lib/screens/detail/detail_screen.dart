import 'package:common/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/database_controller.dart';
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
    checkUserStateIndex(DatabaseController.to.user!.id);
  }

  Future<void> updateScreen() async {
    await GatheringController.to.setGatheringList();
    await DatabaseController.to.getCurrentUser(DatabaseController.to.user!.id);
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
      body: Column(
        children: [
          widget.isHost
              ? Container()
              : _userStateIndex == 0
                  ? Container()
                  : UserGatheringStatus(
                      content: kDetailStateList[_userStateIndex]['guideLine'],
                    ),
          Expanded(
            child: ListView(
              children: [
                UserInfo(
                  userId: widget.gathering.host.userId,
                  imageUrl: widget.gathering.host.imageUrl,
                  name: widget.gathering.host.name,
                  job: widget.gathering.host.job,
                  hostTagList: widget.gathering.host.userTagList,
                ),
                GestureDetector(
                  onTap: () async {
                    User user = await DatabaseController.to
                        .getUser(widget.gathering.host.userId);
                    Get.to(
                      () => ProfileScreen(
                        user: user,
                      ),
                    );
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
                  content: widget.gathering.title,
                  icon: Icons.star,
                  iconColor: kYellowColor,
                ),
                DetailScreenGatheringInfoCard(
                  title: '카테고리',
                  content: widget.gathering.category,
                  icon: Icons.category,
                ),
                DetailScreenGatheringProgressBar(
                  participantCount: widget.gathering.approvalList.length,
                  capacity: widget.gathering.capacity,
                ),
                widget.isHost
                    ? DetailScreenGatheringApplicantsCheckButton(
                        onPressed: () {
                          Get.to(
                            () => ApplicantsScreen(
                              gathering: widget.gathering,
                            ),
                          );
                        },
                      )
                    : Container(),
                DetailScreenGatheringDateTime(
                  openTime: widget.gathering.openTime,
                  endTime: widget.gathering.endTime,
                ),
                DetailScreenGatheringPlaceInfo(
                  location: widget.gathering.location,
                  locationDetail: widget.gathering.locationDetail,
                  hostMessage: widget.gathering.hostMessage,
                ),
                DetailScreenGatheringHashTag(
                  tagList: widget.gathering.tagList,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.isHost
          ? DetailScreenHostBottomBar(
              onPressed: () async {
                await DatabaseController.to
                    .updateGathering(widget.gathering.id, {'over': true});
                Get.offAll(()=>const MainScreen());
              },
              over: widget.gathering.over,
            )
          : DetailScreenUserBottomBar(
              applyPressed: () async {
                await DatabaseController.to
                    .userApplyGathering(widget.gathering.id);
                setState(() {
                  _userStateIndex = 1;
                });
              },
              cancelPressed: () async {
                await DatabaseController.to
                    .userCancelGathering(widget.gathering.id)
                    .then((value) {
                  setState(() {
                    _userStateIndex = 3;
                  });
                });
              },
              userStateIndex: _userStateIndex,
            ),
    );
  }
}
