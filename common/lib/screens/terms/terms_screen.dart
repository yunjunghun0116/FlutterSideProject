import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/terms_screen_text_button.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('이용약관'),
      ),
      body: Column(
        children: [
          TermsScreenTextButton(
            title: 'Common 이용약관',
            onPressed: () {},
          ),
          TermsScreenTextButton(
            title: '개인정보 처리방침',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
