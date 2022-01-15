import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/upload_screen_bottom_bar.dart';
import 'components/upload_screen_category_area.dart';
import 'components/upload_screen_date_time_area.dart';
import 'components/upload_screen_gathering_tag_area.dart';
import 'components/upload_screen_guest_area.dart';
import 'components/upload_screen_host_message_area.dart';
import 'components/upload_screen_location_area.dart';
import 'components/upload_screen_location_search_screen.dart';
import 'components/upload_screen_title_area.dart';
import '../main/main_screen.dart';
import '../../components/user_info.dart';
import '../../constants.dart';
import '../../controllers/database_controller.dart';

class UploadScreen extends StatefulWidget {
  final String category;
  const UploadScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  //Location 관련
  final TextEditingController _locationDetailController =
      TextEditingController();
  final FocusNode _locationFocusNode = FocusNode();
  String _location = '대전 유성구 대학로 99';
  //Guest 관련
  int _guestCount = 1;
  //DateTime 관련
  final DateTime _nowTime = DateTime.now();
  DateTime _openTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  bool _noEndTime = false;
  //hostMessage 관련
  final TextEditingController _hostMessageController = TextEditingController();
  final FocusNode _hostMessageFocusNode = FocusNode();
  //tag 관련
  final TextEditingController _gatheringTagController = TextEditingController();
  final FocusNode _gatheringTagFocusNode = FocusNode();
  final List<String> _gatheringTagList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1,
        title: Text(
          '${DatabaseController.to.user!.name} 호스트',
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: UserInfo(
              userId: DatabaseController.to.user!.id,
              imageUrl: DatabaseController.to.user!.imageUrl,
              name: DatabaseController.to.user!.name,
              job: DatabaseController.to.user!.job,
              hostTagList: DatabaseController.to.user!.userTagList,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UploadScreenTitleArea(
                  controller: _titleController,
                  focusNode: _titleFocusNode,
                ),
                UploadScreenCategoryArea(
                  category: widget.category,
                ),
                UploadScreenGuestArea(
                    guestCount: _guestCount,
                    onChanged: (double value) {
                      setState(() {
                        _guestCount = value.toInt();
                      });
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '모임정보',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                UploadScreenDateTimeArea(
                  noEnd: _noEndTime,
                  nowTime: _nowTime,
                  openTime: _openTime,
                  endTime: _endTime,
                  noEndPressed: () {
                    setState(() {
                      _noEndTime = !_noEndTime;
                    });
                  },
                  openPressed: (DateTime date) {
                    setState(() {
                      if (_endTime.difference(date).inSeconds < 0) {
                        _endTime = _openTime;
                        _openTime = date;
                      } else {
                        _openTime = date;
                      }
                    });
                  },
                  endPressed: (DateTime date) {
                    setState(() {
                      if (date.difference(_openTime).inSeconds < 0) {
                        _endTime = _openTime;
                        _openTime = date;
                      } else {
                        _endTime = date;
                      }
                    });
                  },
                ),
                UploadScreenLocationArea(
                  location: _location,
                  focusNode: _locationFocusNode,
                  controller: _locationDetailController,
                  locationUpdated: (String s) {
                    setState(() {
                      _location = s;
                    });
                  },
                  locationSearchPressed: () async {
                    // _connectController
                    String _placeAddress = await Get.to(
                        () => const UploadScreenLocationSearchScreen());
                    setState(() {
                      _location = _placeAddress;
                    });
                  },
                ),
                UploadScreenHostMessageArea(
                  focusNode: _hostMessageFocusNode,
                  controller: _hostMessageController,
                ),
                UploadScreenGatheringTagArea(
                  focusNode: _gatheringTagFocusNode,
                  controller: _gatheringTagController,
                  tagEnterPressed: (String tag) {
                    setState(() {
                      _gatheringTagList.add(tag);
                    });
                  },
                  tagList: _gatheringTagList,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: UploadScreenBottomBar(
        uploadPressed: () async {
          if (_titleController.text.isEmpty ||
              _locationDetailController.text.isEmpty ||
              _hostMessageController.text.isEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text('모두 입력해주세요!!'),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            '닫기',
                            style: TextStyle(
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            return;
          }
          Map<String, dynamic> body = {
            'host': {
              'userId': DatabaseController.to.user!.id,
              'name': DatabaseController.to.user!.name,
              'imageUrl': DatabaseController.to.user!.imageUrl,
              'job': DatabaseController.to.user!.job,
              'userTagList': DatabaseController.to.user!.userTagList,
            },
            'over': false,
            'title': _titleController.text,
            'category': widget.category,
            'participant': 0,
            'capacity': _guestCount,
            'openTime': _openTime.toString(),
            'endTime': _noEndTime ? '' : _endTime.toString(),
            'location': _location,
            'locationDetail': _locationDetailController.text,
            'hostMessage': _hostMessageController.text,
            'tagList': _gatheringTagList,
            'previousImageList': [],
            'applyList': [],
            'approvalList': [],
            'cancelList': [],
            'timeStamp': DateTime.now().toString(),
          };
          await DatabaseController.to.makeGathering(body).then((value) {
            if (value) {
              Get.offAll(() => const MainScreen());
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: const Text('등록을 실패했습니다'),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              '닫기',
                              style: TextStyle(
                                color: kBlueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          });
        },
      ),
    );
  }
}
