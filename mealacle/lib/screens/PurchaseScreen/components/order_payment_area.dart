import 'package:flutter/material.dart';
import '../../../constants.dart';

class OrderPaymentArea extends StatelessWidget {
  const OrderPaymentArea({Key? key}) : super(key: key);

  Widget yellowCircle() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        width: 20,
        height: 20,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kSelectedColor, width: 1),
        ),
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: kSelectedColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: kTextfieldBackgroundColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('결제수단',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w600,
          ),),
          Row(
            children: [
              yellowCircle(),
              const Text('카드결제'),
            ],
          ),
        ],
      ),
    );
  }
}
