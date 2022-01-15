import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/food.dart';

class FoodController extends GetxController {
  List<Food> foodList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setFoodList(int category) async {
    QuerySnapshot _dbFoodList = await (_firestore
        .collection('food')
        .where('category', isEqualTo: '$category')
        .get());
    List _getFoodList = _dbFoodList.docs.toList();
    //var vs dynamic : var: 변경가능,dynamic : 변경불가
    foodList.clear();
    for (var food in _getFoodList) {
      Map<String,dynamic> data = {
        'id': food.id,
        ...food.data(),
      };
      foodList.add(
        Food.fromMap(data),
      );
    }
    update();
  }
}
