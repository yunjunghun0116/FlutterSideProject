import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'controllers/database_controller.dart';
import 'controllers/connect_controller.dart';
import 'controllers/gathering_controller.dart';
import 'controllers/local_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/start/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseController _controller = Get.put(DatabaseController());
    final LocalController _localController = Get.put(LocalController());
    final UserController _userController = Get.put(UserController());
    final GatheringController _gatheringController =
        Get.put(GatheringController());
    final ConnectController _connectController = Get.put(ConnectController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWF team2',
      theme: ThemeData(
        primaryColor: kGreyColor,
        focusColor: kGreyColor,
      ),
      home: const StartScreen(),
    );
  }
}
