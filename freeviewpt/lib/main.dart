import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home/home_screen.dart';
import 'screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freeview',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
