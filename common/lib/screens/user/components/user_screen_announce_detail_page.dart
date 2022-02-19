import 'package:flutter/material.dart';

import '../../../constants.dart';

class UserScreenAnnounceDetailPage extends StatelessWidget {
  final String category;
  final String title;
  final String content;
  const UserScreenAnnounceDetailPage({Key? key, required this.category, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: Text(category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(title,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const Divider(),
            Text(content,style: const TextStyle(
              fontSize: 16,
            ),),
          ],
        ),
      ),
    );
  }
}
