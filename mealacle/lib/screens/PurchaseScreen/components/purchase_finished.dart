import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../MainScreen/main_screen.dart';

class PurchaseFinished extends StatelessWidget {
  const PurchaseFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () => Get.to(() => const MainScreen()));
    return Scaffold(
      backgroundColor: kSelectedColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '주문 완료!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
          const Text(
            '주문은 오전 9시 오후 9시 \n두차례에 걸쳐 배송됩니다.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
