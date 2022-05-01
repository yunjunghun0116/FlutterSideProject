import 'package:common/controllers/local_controller.dart';
import 'package:common/screens/search/components/search_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class SearchTextScreen extends StatefulWidget {
  const SearchTextScreen({Key? key}) : super(key: key);

  @override
  State<SearchTextScreen> createState() => _SearchTextScreenState();
}

class _SearchTextScreenState extends State<SearchTextScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      decoration: BoxDecoration(
                        color: kWhiteColorE7,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _searchTextController,
                        autofocus: true,
                        cursorColor: kMainColor,
                        maxLines: 1,
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          hintText: '검색어 입력',
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: kMainColor,
                          ),
                          border: InputBorder.none,
                          focusColor: kMainColor,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onSubmitted: (String s) {
                          LocalController.to.addSearchTerm(s);
                          Get.off(() => SearchResultScreen(searchTerm: s));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '최근 검색어',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                  future: LocalController.to.getSearchTerm(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List _recentlySearchTerm = snapshot.data;
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _recentlySearchTerm.map((searchTerm) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kWhiteColorE7,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    LocalController.to
                                        .addSearchTerm(searchTerm);
                                    Get.off(() => SearchResultScreen(
                                        searchTerm: searchTerm));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      searchTerm,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    LocalController.to
                                        .removeSearchTerm(searchTerm);
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
