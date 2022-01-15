import 'package:flutter/material.dart';
import 'package:freeviewpt/constants.dart';
import '../../../models/designer.dart';

class DesignScreenCardPriceArea extends StatelessWidget {
  final Designer designer;
  const DesignScreenCardPriceArea({Key? key, required this.designer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '45,000원',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 10),
              Icon(Icons.favorite_outline, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
