import 'package:flutter/material.dart';
import 'components/university_screen_location_select_area.dart';
import 'components/university_screen_university_select_area.dart';
import '../../constants.dart';
import '../../controllers/local_controller.dart';
import '../../controllers/database_controller.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  int _currentLocationListIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('학교설정'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: UniversityScreenLocationSelectArea(
              currentIndex: _currentLocationListIndex,
              locationList: kLocationList,
              locationClicked: (int index) {
                setState(() {
                  _currentLocationListIndex = index;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: UniversityScreenUniversitySelectArea(
              universityList: kLocationList[_currentLocationListIndex]
                  ['university'],
            ),
          ),
        ],
      ),
    );
  }
}
