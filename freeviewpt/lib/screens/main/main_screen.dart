import 'package:flutter/material.dart';
import 'package:freeviewpt/screens/user/user_screen.dart';
import 'package:get/get.dart';
import 'components/main_screen_bottom_navigation_bar.dart';
import '../category/category_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../../controller/designer_controller.dart';
import '../../components/user_location_screen.dart';
import '../../controller/filter_designer_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentBottomBarIndex = 0;
  final DesignerController _designerController = Get.put(DesignerController());
  final FilterDesignerController _filterDesignerController =
      Get.put(FilterDesignerController());

  Widget _getScreens() {
    switch (_currentBottomBarIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoryScreen();
      case 2:
        return const ChatScreen();
      default:
        return const UserScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _currentBottomBarIndex == 0 || _currentBottomBarIndex == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const UserLocationScreen());
                        },
                        child: Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text(
                                //TODO locationController 사용해서 가져오기
                                '둔산동/월평동/만년동..',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const RotatedBox(
                              quarterTurns: 1,
                              child: Icon(Icons.arrow_forward_ios,size: 15,),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: _getScreens(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainScreenBottomNavigationBar(
        currentBottomBarIndex: _currentBottomBarIndex,
        onTapFunction: (int index) {
          setState(() {
            _currentBottomBarIndex = index;
          });
        },
      ),
    );
  }
}
