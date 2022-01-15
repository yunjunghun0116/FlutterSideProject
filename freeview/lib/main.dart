import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/HomeScreen/home_screen.dart';
import './screens/MainScreen/main_screen.dart';
import './screens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';
// googleApiKey : AIzaSyBvD79Y7m_UW7pzWAnsZsA7-EgKmEKviEA
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
      title: 'Freeview',
      theme: ThemeData(primaryColor: Colors.black),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => const SplashScreen(),
        ),
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
