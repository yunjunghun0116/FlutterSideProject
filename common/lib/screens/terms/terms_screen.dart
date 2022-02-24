import 'package:common/screens/terms/components/terms_screen_privacy_policy_page.dart';
import 'package:common/screens/terms/components/terms_screen_use_terms_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            onPressed: ()=>Get.to(()=>const TermsScreenUseTermsPage()),
          ),
          TermsScreenTextButton(
            title: '개인정보 처리방침',
            onPressed: ()=>Get.to(()=>const TermsScreenPrivacyPolicyPage()),
          ),
        ],
      ),
    );
  }
}
