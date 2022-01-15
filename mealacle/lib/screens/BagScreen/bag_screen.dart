import 'package:flutter/material.dart';
import '../../controllers/database_controller.dart';
import 'components/food_in_basket_area.dart';
import 'components/purchase_button.dart';

class BagScreen extends StatefulWidget {
  final Function backPressed;
  const BagScreen({
    Key? key,
    required this.backPressed,
  }) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final DatabaseController controller = DatabaseController.to;
  bool isNullBasket = false;

  @override
  void initState() {
    super.initState();
    checkIsNullBasket();
  }

  void checkIsNullBasket() async {
    List _check = await controller.getBasketList();
    if (_check.isEmpty) {
      setState(() {
        isNullBasket = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            widget.backPressed();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          '장바구니',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          FoodInBasketArea(controller: controller),
          isNullBasket ? Container() : const PurchaseButton(),
        ],
      ),
    );
  }
}
