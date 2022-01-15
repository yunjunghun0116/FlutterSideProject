import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/food_in_purchased_area.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          '주문 내역',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: FoodInPurchasedArea(),
    );
  }
}
