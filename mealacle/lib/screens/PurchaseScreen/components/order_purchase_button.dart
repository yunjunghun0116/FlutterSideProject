import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/database_controller.dart';
import '../../../constants.dart';
import 'purchase_finished.dart';

class OrderPurchaseButton extends StatelessWidget {
  const OrderPurchaseButton({
    Key? key,
    required this.isChecked,
    required this.controller,
    required this.allFoodPrice,
    required this.discountPrice,
  }) : super(key: key);

  final bool isChecked;
  final DatabaseController controller;
  final int allFoodPrice;
  final int discountPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isChecked) {
          await controller.setPurchasedList();
          Get.to(() => const PurchaseFinished());
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: isChecked ? kSelectedColor : kTextfieldBackgroundColor,
        ),
        child: Center(
          child: Text(
            isChecked
                ? '${kPriceComma((allFoodPrice - discountPrice).toString())}원 구매하기'
                : '개인정보 수집항목을 확인해주세요',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
