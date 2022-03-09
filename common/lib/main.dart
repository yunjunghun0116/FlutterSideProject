import 'package:common/controllers/announce_controller.dart';
import 'package:common/controllers/post_controller.dart';
import 'package:common/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'constants.dart';
import 'controllers/connect_controller.dart';
import 'controllers/gathering_controller.dart';
import 'controllers/local_controller.dart';
import 'controllers/user_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: kKakaoNativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalController _localController = Get.put(LocalController());
    final UserController _userController = Get.put(UserController());
    final GatheringController _gatheringController =
        Get.put(GatheringController());
    final ConnectController _connectController = Get.put(ConnectController());
    final PostController _postController = Get.put(PostController());
    final AnnounceController _announceController = Get.put(AnnounceController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Common',
      theme: ThemeData(
        primaryColor: kGreyColor,
        focusColor: kGreyColor,
      ),
      home: const SplashScreen(),
    );
  }
}
