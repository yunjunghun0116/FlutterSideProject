import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/gathering_card.dart';
import '../../../constants.dart';
import '../../../controllers/user_controller.dart';
import '../../../models/gathering.dart';

class SearchResultScreen extends StatelessWidget {
  final String searchTerm;
  const SearchResultScreen({Key? key, required this.searchTerm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: kWhiteColorE7,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Icon(
                              Icons.search_outlined,
                              color: kMainColor,
                            ),
                          ),
                          Text(
                            '$searchTerm 검색결과',
                            style: const TextStyle(
                              color: kDarkGreyColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(),
            ),
            Expanded(
              child: StreamBuilder(
                stream: GatheringController.to
                    .getSearchKeywordGatheringListStream(searchTerm),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return  Center(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            '원하는 모임이 없을땐\n하루모임을 만들고\n사람들과 모임을 가져보세요!!!',
                            style: TextStyle(
                              fontSize: 24,
                              color: kGreyColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: snapshot.data!.docs.map((e) {
                        Gathering gathering = Gathering.fromJson({
                          'id': e.id,
                          ...e.data() as Map<String, dynamic>,
                        });
                        if (!gathering.reportedList
                                .contains(UserController.to.user!.id) &&
                            !UserController.to.user!.blockUser
                                .contains(gathering.host.userId)) {
                          return GatheringCard(gathering: gathering);
                        }
                        return Container();
                      }).toList(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
