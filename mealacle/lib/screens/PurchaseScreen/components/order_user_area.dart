import 'package:flutter/material.dart';
import '../../../constants.dart';

class OrderUserArea extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhoneNumber;
  const OrderUserArea({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kTextfieldBackgroundColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '주문자 정보',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(userName),
          Text(userEmail),
          Text(userPhoneNumber)
        ],
      ),
    );
  }
}
