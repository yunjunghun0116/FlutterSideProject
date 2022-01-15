import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/food.dart';

class DatabaseController extends GetxController {
  static SharedPreferences? _sharedPreferences;
  static DatabaseController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    _sharedPreferences = await SharedPreferences.getInstance();
    update();
  }

  void clear() {
    _sharedPreferences!.clear();
  }

  //유저의 대학교
  Future<void> setUserUniv(String town, String univ) async {
    await _sharedPreferences!.setStringList('userUniv', [town, univ]);
  }

  List<String>? getUserUniv() {
    return _sharedPreferences!.getStringList('userUniv');
  }

  // 장바구니
  Future<void> setFoodToBasket(Food food) async {
    List<String>? lists = _sharedPreferences!.getStringList('basket');
    String jsonString = food.toJsonString();
    if (lists != null) {
      lists.add(jsonString);
    } else {
      lists = [];
      lists.add(jsonString);
    }
    await _sharedPreferences!.setStringList('basket', lists);
  }

  Future<List<Food>> getBasketList() async {
    List<String>? _getList = _sharedPreferences!.getStringList('basket');
    List<Food> _foodList = [];
    if (_getList != null) {
      for (var e in _getList) {
        Food food = Food.fromStorageMap(jsonDecode(e));
        _foodList.add(food);
      }
    }
    return _foodList;
  }

  Future<void> removeFoodInBasketList(int index) async {
    List<String>? _getList = _sharedPreferences!.getStringList('basket');
    if (_getList != null) {
      _getList.removeAt(index);
      await _sharedPreferences!.setStringList('basket', _getList);
    }
  }

  Future<void> changeFoodCount(int index, int count) async {
    List<String>? _getList = _sharedPreferences!.getStringList('basket');
    if (_getList != null) {
      Map<String, dynamic> data = jsonDecode(_getList[index]);
      data['selectedCount'] = count;
      _getList[index] = Food.fromStorageMap(data).toJsonString();
      await _sharedPreferences!.setStringList('basket', _getList);
    }
  }

  //유저의 구매목록
  Future<void> setPurchasedList() async {
    List<String>? _getList = _sharedPreferences!.getStringList('purchased');
    List<String>? _basketList = _sharedPreferences!.getStringList('basket');
    if (_basketList != null) {
      if (_getList != null) {
        _getList.addAll(_basketList);
        await _sharedPreferences!.setStringList('purchased', _getList);
      } else {
        await _sharedPreferences!.setStringList('purchased', _basketList);
      }
    }
    await _sharedPreferences!.setStringList('basket', []);
  }

  Future<List<Food>> getPurchasedList() async {
    List<String>? _getList = _sharedPreferences!.getStringList('purchased');
    List<Food> _foodList = [];
    if (_getList != null) {
      for (var e in _getList) {
        Food food = Food.fromStorageMap(jsonDecode(e));
        _foodList.add(food);
      }
    }
    return _foodList;
  }
}
