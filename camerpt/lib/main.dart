import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login/login_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CamerProtoType',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/',
          page: () => const MainScreen(),
        ),
      ],
    );
  }
}