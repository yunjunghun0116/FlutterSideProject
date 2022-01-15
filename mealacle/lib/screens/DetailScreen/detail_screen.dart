import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/food.dart';
import '../../constants.dart';
import 'components/food_image_area.dart';
import 'components/food_info_area.dart';
import 'components/food_title_area.dart';
import 'components/custom_purchase_bottom_bar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Food food = Get.arguments;
  bool _isPurchaseClicked = false;
  String _foodPrice = "0";

  @override
  void initState() {
    super.initState();
    setState(() {
      _foodPrice = food.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: size.height * 0.1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/main');
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
            FoodImageArea(
              size: size,
              foodImage: food.image,
            ),
            FoodTitleArea(
              foodName: food.name,
              foodPrice: food.price,
              pointVoter: 38,
              foodPoint: 4.5,
            ),
            kDivider(1),
            FoodInfoArea(
              foodId: food.id,
              foodName: food.name,
              foodOrigin: food.origin,
              foodSeller: food.sellerName,
            ),
            SizedBox(
              width: double.infinity,
              child: food.descriptionImage!=""
                  ? Image.network(
                      food.descriptionImage,
                      fit: BoxFit.fill,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomPurchaseBottomBar(
        isPurchaseClicked: _isPurchaseClicked,
        purchaseClickedFunction: () {
          setState(() {
            _isPurchaseClicked = true;
          });
        },
        food:food,
        foodPrice: _foodPrice,
      ),
    );
  }
}
