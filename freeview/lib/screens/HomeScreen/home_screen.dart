import 'package:flutter/material.dart';
import 'package:freeview/controller/designer_controller.dart';
import 'package:freeview/screens/HomeScreen/components/google_map_screen.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/advertising_area.dart';
import 'components/recommend_artist_area.dart';
import 'components/top_category_container.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCategoryIndex = 0;
  final DesignerController _designerController = DesignerController.to;

  Widget _getMainArea() {
    if (_currentCategoryIndex == 0) {
      return Column(
        children: [
          const HomeScreenAdvertisingArea(),
          RecommendArtistArea(
            designerList: _designerController.designerList,
          ),
        ],
      );
    } else if (_currentCategoryIndex == 1) {
      return Column(
        children: const [
          GoogleMapScreen(),
        ],
      );
    } else {
      return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              HomeScreenTopCategoryContainer(
                onTapFunction: () {
                  setState(() {
                    _currentCategoryIndex = 0;
                  });
                },
                categoryTitle: '홈',
                currentCategoryIndex: _currentCategoryIndex,
                categoryIndex: 0,
              ),
              HomeScreenTopCategoryContainer(
                onTapFunction: () {
                  setState(() {
                    _currentCategoryIndex = 1;
                  });
                },
                categoryTitle: '내 주변',
                currentCategoryIndex: _currentCategoryIndex,
                categoryIndex: 1,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _getMainArea(),
            ),
          )
        ],
      ),
      bottomNavigationBar: _currentCategoryIndex == 1
          ? const HomeScreenBottomNavigationBar()
          : null,
    );
  }
}
