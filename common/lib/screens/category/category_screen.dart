import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../upload/upload_screen.dart';
import '../../constants.dart';
import '../../components/gathering_card.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: GatheringController.to.getCategoryGatheringListStream(category),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView(
              children: [
                Column(
                  children: snapshot.data!.docs.map((e) {
                    Gathering gathering = Gathering.fromJson({
                      'id':e.id,
                      ...e.data() as Map<String,dynamic>
                    });
                    return GatheringCard(
                        gathering: gathering
                    );
                  }).toList(),
                ),
              ],
            );
          }
          return CircularProgressIndicator();

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => UploadScreen(category: category));
        },
        backgroundColor: kYellowColor,
        foregroundColor: kWhiteColor,
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
