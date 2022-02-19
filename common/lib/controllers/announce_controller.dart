import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AnnounceController extends GetxController {
  static AnnounceController get to => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAnnounceListStream() {
    return _firestore.collection('announce').snapshots();
  }
}
