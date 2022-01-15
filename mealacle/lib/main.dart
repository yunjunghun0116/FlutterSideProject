import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/DetailScreen/detail_screen.dart';
import 'screens/UnivSelectScreen/univ_select_screen.dart';
import 'screens/MainScreen/main_screen.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealacleApp',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: '/univ',
          page: () => const UnivSelectScreen(),
        ),
        GetPage(
          name: '/main',
          page: () => const MainScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailScreen(),
        ),
      ],
    );
  }
}
