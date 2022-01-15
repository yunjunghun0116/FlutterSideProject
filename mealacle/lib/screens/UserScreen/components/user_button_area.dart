import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../PurchaseHistoryScreen/purchase_history_screen.dart';
import '../../../controllers/database_controller.dart';
import 'user_button.dart';

class UserButtonArea extends StatelessWidget {
  const UserButtonArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          UserButton(
            image: 'assets/images/outline_receipt_black_48dp.png',
            title: '주문내역',
            onClicked: () {
              Get.to(() => PurchaseHistoryScreen());
            },
          ),
          const SizedBox(width: 10),
          UserButton(
            image: 'assets/images/bell.png',
            title: '알림',
            onClicked: () {
              DatabaseController.to.clear();
            },
          ),
        ],
      ),
    );
  }
}
