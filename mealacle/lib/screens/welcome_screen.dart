import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/database_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final DatabaseController controller = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(
      const Duration(seconds: 3),
      () async=> {
        if (controller.getUserUniv() == null)
          Get.toNamed('/univ')
        else
          Get.toNamed('/main')
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFDE792),
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Mealacle',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
