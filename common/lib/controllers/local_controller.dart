import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController extends GetxController {
  static LocalController get to => Get.find();
  SharedPreferences? _sharedPreferences;
  final String _idKey = 'id';
  final String _certificationTimeKey = 'certificationTime';
  final String _searchTermKey = 'searchTerm';

  @override
  void onInit() async {
    super.onInit();
    await _setSharedPreferences();
  }

  Future<void> _setSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    update();
  }

  Future<void> clearSharedPreferences() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    await _sharedPreferences!.clear();
  }

  Future<void> setId(String id) async {
    await _sharedPreferences!.setString(_idKey, id);
  }

  Future<String?> getId() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_idKey);
  }

  Future<void> setCertificationTime(DateTime time) async {
    await _sharedPreferences!.setString(_certificationTimeKey, time.toString());
  }

  Future<String?> getCertificationTime() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_certificationTimeKey);
  }

  Future<void> addSearchTerm(String term) async {
    await _sharedPreferences!.setStringList(
      _searchTermKey,
      [...await getSearchTerm(), term],
    );
  }

  Future<void> removeSearchTerm(String term) async {
    (await getSearchTerm()).remove(term);
  }

  Future<List> getSearchTerm() async {
    if (_sharedPreferences == null) {
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getStringList(_searchTermKey)??[];
  }
}
