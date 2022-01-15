import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealacle/screens/UserScreen/user_screen.dart';
import '../../controllers/database_controller.dart';
import '../BagScreen/bag_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../SearchScreen/search_screen.dart';
import 'components/custom_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _userUniv;
  DatabaseController controller = Get.find<DatabaseController>();
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    List<String>? userData = controller.getUserUniv();
    _userUniv = userData != null ? userData[1] : '대학교';
  }

  Widget _selectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(
          userUniv: _userUniv!,
          categorySelected: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
        );
      case 1:
        return SearchScreen(
            userUniv: _userUniv!,
            backPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            bagPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            });
      case 2:
        return BagScreen(
          backPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        );
      case 3:
        return const UserScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedWidget(),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onPressed: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
