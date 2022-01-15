import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/database_controller.dart';
import '../../models/food.dart';
import 'components/order_food_area.dart';
import 'components/order_payment_area.dart';
import 'components/order_price_area.dart';
import 'components/order_user_area.dart';
import 'components/order_purchase_button.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);
  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final DatabaseController controller = DatabaseController.to;
  List<Food> orderList = [];
  bool isDataGet = false;
  bool isChecked = false;
  int allFoodPrice = 0;
  int discountPrice = 0;

  @override
  void initState() {
    super.initState();
    controller.getBasketList().then((value) {
      orderList = value;
    }).then((value) {
      for (var food in orderList) {
        allFoodPrice += (int.parse(food.price) +
                int.parse(food.selectedOptionPrice ?? '0')) *
            (food.selectedCount ?? 1);
      }
      setState(() {
        allFoodPrice;
        isDataGet = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          '주문결제',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: isDataGet == true
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const OrderUserArea(
                    userName: '홍길동',
                    userEmail: 'test123@naver.com',
                    userPhoneNumber: '010-1234-5678',
                  ),
                  OrderFoodArea(
                    orderList: orderList,
                  ),
                  OrderPriceArea(
                    allFoodPrice: allFoodPrice,
                    discountPrice: discountPrice,
                    orderList: orderList,
                  ),
                  const OrderPaymentArea(),
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          }),
                      const Text('개인정보 수집 및 이용동의(필수)'),
                    ],
                  )
                ],
              ),
            )
          : Container(),
      bottomNavigationBar: isDataGet == true
          ? OrderPurchaseButton(
              isChecked: isChecked,
              controller: controller,
              allFoodPrice: allFoodPrice,
              discountPrice: discountPrice,
            )
          : null,
    );
  }
}
