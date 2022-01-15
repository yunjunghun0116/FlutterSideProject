import 'package:flutter/material.dart';
import 'package:freeview/controller/designer_controller.dart';
import 'package:get/get.dart';
import '../HomeScreen/home_screen.dart';
import 'components/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentBottomBarIndex = 0;
  final DesignerController _designerController = Get.put(DesignerController());

  Widget _getScreens() {
    switch (_currentBottomBarIndex) {
      case 0:
        return const HomeScreen();
      default:
        return Text('$_currentBottomBarIndex');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    '대전 서구 둔산동',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
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
