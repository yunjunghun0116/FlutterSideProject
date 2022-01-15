import 'package:flutter/material.dart';
import '../../../constants.dart';


class CompanyExplanationTextArea extends StatelessWidget {
  const CompanyExplanationTextArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 12),
          children: [
            TextSpan(
              style: TextStyle(
                color: kTextfieldBackgroundColor,
              ),
              children: [
                TextSpan(
                    text:
                    'Mealacle은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 따라서 Mealacle은 상품,거래 정보 및 거래에 책임을 지지 않습니다.\n\n'),
                TextSpan(text: '상호명 : Mealacle\n'),
                TextSpan(
                    text: '대표 : 윤정훈 | 사업자등록번호 : 000-00-00000\n'),
                TextSpan(text: '이메일 : yunjunghun0116@gmail.com\n'),
                TextSpan(text: '주소 : 대전광역시 유성구 대학로 99(충남대학교)\n\n'),
              ],
            ),
            TextSpan(text: '사업자정보확인 | 이용약관 | 전자금융거래이용약관 | 개인정보처리방침')
          ],
        ),
      ),
    );
  }
}

