import 'package:get/get.dart';
import '../controllers/database_controller.dart';
import '../models/gathering.dart';

class GatheringController extends GetxController {
  static GatheringController get to => Get.find();

  List<Gathering> _gatheringList = [];
  List<Gathering> get gatheringList => _gatheringList;

  List<Gathering> _categoryGatheringList = [];
  List<Gathering> get categoryGatheringList => _categoryGatheringList;

  Future<void> setGatheringList() async {
    _gatheringList = (await DatabaseController.to.getGatheringDocs()) ?? [];
    update();
  }

  Future<void> setCategoryGatheringList(String category) async {
    _categoryGatheringList = [];
    for (Gathering gathering in _gatheringList) {
      if (category == '전체보기' || gathering.category == category) {
        _categoryGatheringList.add(gathering);
      }
    }
    update();
  }
}
