import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/designer_controller.dart';
import '../../../models/designer.dart';
import '../../../constants.dart';
import 'user_screen_like_designer_card.dart';

class UserScreenLikeDesigner extends StatefulWidget {
  const UserScreenLikeDesigner({Key? key}) : super(key: key);

  @override
  _UserScreenLikeDesignerState createState() => _UserScreenLikeDesignerState();
}

class _UserScreenLikeDesignerState extends State<UserScreenLikeDesigner> {
  final DesignerController _designerController = DesignerController.to;

  List<Designer> _designerList = [];
  List<bool> _designerClickedList = [];
  List<int> _clickedDesignerIndexList = [];
  bool _editClicked = false;

  @override
  void initState() {
    super.initState();
    _designerList = _designerController.designerList;
    _designerClickedList = [for (Designer _ in _designerList) false];
  }

  Widget _getDesignerCard(Size size) {
    List<UserScreenLikeDesignerCard> _returnList = [];
    for (int i = 0; i < _designerList.length; i++) {
      _returnList.add(
        UserScreenLikeDesignerCard(
          designer: _designerList[i],
          isEditClicked: _editClicked,
          isDesignerClicked: _designerClickedList[i],
          size: size,
          onPressed: () {
            print(i);
            if (_designerClickedList[i] == false) {
              _clickedDesignerIndexList.add(i);
            }
            setState(() {
              _designerClickedList[i] = !_designerClickedList[i];
            });
          },
        ),
      );
    }
    return ListView(
      children: _returnList,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kSelectedColor,
          ),
        ),
        title: const Text(
          '구독 목록',
          style: TextStyle(
            color: kSelectedColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _editClicked = !_editClicked;
                if (!_editClicked) {
                  for (int index in _clickedDesignerIndexList) {
                    _designerClickedList[index] = false;
                  }
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                _editClicked ? '취소' : '수정',
                style: TextStyle(
                  color: _editClicked ? kUnSelectedColor : kBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _getDesignerCard(size),
          ),
          _editClicked
              ? GestureDetector(
                  onTap: () {
                    _clickedDesignerIndexList.sort();
                    for (int i = _clickedDesignerIndexList.length - 1;
                        i >= 0;
                        i--) {
                      _designerList.removeAt(_clickedDesignerIndexList[i]);
                      _designerClickedList
                          .removeAt(_clickedDesignerIndexList[i]);
                    }
                    setState(() {
                      _clickedDesignerIndexList = [];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                            '${_clickedDesignerIndexList.length}',
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '찜 해제',
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
