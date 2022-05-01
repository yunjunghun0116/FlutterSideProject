import 'package:common/constants.dart';
import 'package:common/screens/search/components/search_text_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category/category_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const SearchTextScreen()),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: kWhiteColorE7,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search_outlined,
                        color: kMainColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '검색어 입력',
                        style: TextStyle(
                          fontSize: 14,
                          color: kDarkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '카테고리',
                style: TextStyle(
                  fontSize: 24,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 8,
                spacing: 8  ,
                children: kCategoryList.map((e) {
                  return Material(
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kWhiteColorE7,
                      ),
                      child: InkWell(
                        onTap: () {
                          /*클릭시 해당 필터를 갖고 결과를 보여주기*/
                          Get.to(() => CategoryScreen(category: e['title']));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.transparent,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: Icon(e['icon']),
                              ),
                              const SizedBox(width: 15),
                              Text(e['title']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
