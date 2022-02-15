import 'package:flutter/material.dart';
import 'components/location_screen_city_select_area.dart';
import 'components/location_screen_town_select_area.dart';
import '../../constants.dart';

class LocationScreen extends StatefulWidget {
  final bool? update;
  const LocationScreen({Key? key, this.update}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int _currentLocationListIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: const Text('지역설정'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LocationScreenCitySelectArea(
              currentIndex: _currentLocationListIndex,
              locationList: kCityList,
              locationClicked: (int index) {
                setState(() {
                  _currentLocationListIndex = index;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: LocationScreenTownSelectArea(
              selectedIndex: _currentLocationListIndex,
              update: widget.update ?? false,
              townList: kCityList[_currentLocationListIndex]['town'],
            ),
          ),
        ],
      ),
    );
  }
}
