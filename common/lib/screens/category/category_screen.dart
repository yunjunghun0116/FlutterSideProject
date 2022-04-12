import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart';
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
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  '모임을 만들고\n사람들과 모임을 가져보세요!!!',
                  style: TextStyle(
                    fontSize: 24,
                    color: kGreyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView(
              children: [
                Column(
                  children: snapshot.data!.docs.map((e) {
                    Gathering gathering = Gathering.fromJson({
                      'id':e.id,
                      ...e.data() as Map<String,dynamic>
                    });
                    if (!gathering.reportedList
                        .contains(UserController.to.user!.id) &&
                        !UserController.to.user!.blockUser
                            .contains(gathering.host.userId)) {
                      return GatheringCard(gathering: gathering);
                    }
                    return Container();
                  }).toList(),
                ),
              ],
            );
          }
          return Container();

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => UploadScreen(category: category));
        },
        backgroundColor: kMainColor,
        foregroundColor: kWhiteColor,
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
