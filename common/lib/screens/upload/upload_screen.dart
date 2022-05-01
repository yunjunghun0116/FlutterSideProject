import 'package:common/controllers/gathering_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/gathering.dart';
import 'package:common/utils.dart';
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

class UploadScreen extends StatefulWidget {
  final String category;
  final Gathering? gathering;
  const UploadScreen({
    Key? key,
    required this.category,
    this.gathering,
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
  String _location = '장소를 설정해주세요!!';
  //Guest 관련
  int _guestCount = 1;
  //DateTime 관련
  final DateTime _nowTime = DateTime.now();
  DateTime _openTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(days: 7));
  bool _noEndTime = false;
  //hostMessage 관련
  final TextEditingController _hostMessageController = TextEditingController();
  final FocusNode _hostMessageFocusNode = FocusNode();
  //tag 관련
  final TextEditingController _gatheringTagController = TextEditingController();
  final FocusNode _gatheringTagFocusNode = FocusNode();
  List _gatheringTagList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.gathering != null) {
      setState(() {
        _titleController.text = widget.gathering!.title;
        _locationDetailController.text = widget.gathering!.locationDetail;
        _hostMessageController.text = widget.gathering!.hostMessage;
        _guestCount = widget.gathering!.capacity;
        _openTime = DateTime.parse(widget.gathering!.openTime);
        widget.gathering!.endTime != ''
            ? _endTime = DateTime.parse(widget.gathering!.endTime)
            : null;
        _location = widget.gathering!.location;
        _gatheringTagList = widget.gathering!.tagList;
      });
    }
  }

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
          '${UserController.to.user!.name} 호스트',
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: kWhiteColor,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: UserInfo(
                        userId: UserController.to.user!.id,
                        imageUrl: UserController.to.user!.imageUrl,
                        name: UserController.to.user!.name,
                        job: UserController.to.user!.job,
                        hostTagList: UserController.to.user!.userTagList,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
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
                              if (!_noEndTime &&
                                  _endTime.difference(date).inSeconds < 0) {
                                setState(() {
                                  _openTime = _endTime;
                                  _endTime = date;
                                });
                              } else {
                                setState(() {
                                  _openTime = date;
                                });
                              }
                            },
                            endPressed: (DateTime date) {
                              if (_openTime.difference(date).inSeconds > 0) {
                                setState(() {
                                  _endTime = _openTime;
                                  _openTime = date;
                                });
                              } else {
                                setState(() {
                                  _endTime = date;
                                });
                              }
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
                              Map<String, dynamic>? _placeInfo = await Get.to(
                                  () =>
                                      const UploadScreenLocationSearchScreen());
                              if (_placeInfo != null) {
                                setState(() {
                                  _location = _placeInfo['address'];
                                  _locationDetailController.text =
                                      _placeInfo['place'];
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          UploadScreenHostMessageArea(
                            focusNode: _hostMessageFocusNode,
                            controller: _hostMessageController,
                          ),
                          const SizedBox(height: 20),
                          UploadScreenGatheringTagArea(
                            focusNode: _gatheringTagFocusNode,
                            controller: _gatheringTagController,
                            tagEnterPressed: (String tag) {
                              if (!_gatheringTagList.contains(tag)) {
                                setState(() {
                                  _gatheringTagList.add(tag);
                                });
                              } else {
                                getDialog(title: '중복된 키워드입력은 불가능합니다!!');
                              }
                            },
                            tagRemovePressed: (String s) {
                              _gatheringTagList.remove(s);
                              setState(() {});
                            },
                            tagList: _gatheringTagList,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: UploadScreenBottomBar(
                  isUpdate: widget.gathering != null,
                  uploadPressed: () async {
                    if (_titleController.text.isEmpty ||
                        _location == '장소를 설정해주세요!!' ||
                        _locationDetailController.text.isEmpty ||
                        _hostMessageController.text.isEmpty) {
                      await getDialog(title: '하루모임의 모든정보를 입력해주세요!!');
                      return;
                    }
                    if (_gatheringTagList.length <= 2) {
                      await getDialog(
                          title: '사람들이 검색할 수 있도록\n3개이상의 키워드를 입력해주세요!!');
                      return;
                    }
                    Map<String, dynamic> body = {
                      'host': {
                        'userId': UserController.to.user!.id,
                        'name': UserController.to.user!.name,
                        'imageUrl': UserController.to.user!.imageUrl,
                        'job': UserController.to.user!.job,
                        'userTagList': UserController.to.user!.userTagList,
                      },
                      'hostId':UserController.to.user!.id,
                      'over': false,
                      'title': _titleController.text,
                      'category': widget.category,
                      'participant': 1,
                      'capacity': _guestCount,
                      'city': UserController.to.user!.city,
                      'town': UserController.to.user!.town,
                      'openTime': _openTime.toString(),
                      'endTime': _noEndTime ? '' : _endTime.toString(),
                      'location': _location,
                      'locationDetail': _locationDetailController.text,
                      'hostMessage': _hostMessageController.text,
                      'tagList': _gatheringTagList,
                      'approvalUserIdList':[],
                      'applyList': [],
                      'approvalList': [],
                      'cancelList': [],
                      'reportedList': [],
                      'timeStamp': DateTime.now().toString(),
                    };
                    if (widget.gathering != null) {
                      await GatheringController.to.updateGathering(
                          gatheringId: widget.gathering!.id, body: body);
                      Get.offAll(() => const MainScreen());
                      return;
                    }
                    await GatheringController.to
                        .makeGathering(body)
                        .then((value) {
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
                                          color: kMainColor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
