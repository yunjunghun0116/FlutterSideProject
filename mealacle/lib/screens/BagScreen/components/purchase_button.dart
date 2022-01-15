import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealacle/screens/PurchaseScreen/purchase_screen.dart';

import '../../../constants.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: InkWell(
        onTap: () {
          Get.to(() => const PurchaseScreen());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: const BoxDecoration(
            color: kSelectedColor,
            border: Border(
              top: BorderSide(
                color: kTextfieldBackgroundColor,
              ),
              bottom: BorderSide(
                color: kTextfieldBackgroundColor,
              ),
            ),
          ),
          child: const Center(
            child: Text(
              '구매하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
