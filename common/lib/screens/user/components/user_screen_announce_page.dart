import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/announce_controller.dart';
import 'package:common/screens/user/components/user_screen_announce_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class UserScreenAnnouncePage extends StatelessWidget {
  const UserScreenAnnouncePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('공지사항'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
            stream: AnnounceController.to.getAnnounceListStream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    children: snapshot.data!.docs.map((e) {
                  return GestureDetector(
                    onTap: () => Get.to(
                      () => UserScreenAnnounceDetailPage(
                          category: e['category'],
                          title: e['title'],
                          content: e['content']),
                    ),
                    child: Container(
                      color: kWhiteColor,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '[${e['category']}] ${e['title']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${e['content']}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  );
                }).toList());
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
