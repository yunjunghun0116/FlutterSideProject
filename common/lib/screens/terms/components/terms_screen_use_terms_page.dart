import 'package:flutter/material.dart';

import '../../../constants.dart';

class TermsScreenUseTermsPage extends StatelessWidget {
  const TermsScreenUseTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('커먼 이용약관'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('''
이용약관 

제 1조 목적

이 약관은 커먼(이하 “회사”라 합니다)가 제공하는 모든 커먼 서비스(이하 “서비스”라 합니다)를 이용함에 있어 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. 본 약관은 PC, 스마트폰(안드로이드폰, 아이폰 등), 모바일 애플리케이션 등을 이용하는 전자상거래에 대해서도 그 성질이 반하지 않는 한 똑같이 적용됩니다.


제 2조 용어와 정의

본 약관에서 사용하는 용어의 의미는 다음과 같습니다. 본 약관에서 정의되지 않은 용어는 일반 관행에 따라 정의돈 의미를 가집니다.

1. “커먼”이란 회사가 재화, 용역 또는 서비스(이하 “재화 등”이라 합니다)를 이용자에게 제공하기 위하여 스마트폰, 컴퓨터 등과 같은 정보 통신 설비/장비/네트워크를 이용하여 거래할 수 있도록 설정하여 제공하는 서비스 플랫폼을 말합니다.

2. “커먼 서비스”(이하 서비스)란 가맹 계약을 맺은 디자이너에 대한 정보를 노출하고, 이용자가 서비스를 이용해서 가맹 디자이너에게 문의 할 수 있도록 회사가 제공하는 인터넷 기반의 중개 서비스를 의미하며, 회사에 의해 수시로 변경되는 커먼 서비스를 포함합니다.

3. “회원”이란 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 재화 등을 계속적으로 이용할 수 있는 자를 의미하고, 회사의 광고업소는 포함되지 않습니다.

4. “비회원”이란 “회원”으로 가입하지 않고 “회사”가 제공하는 서비스를 이용하는 자를 말합니다.
 
5. “이용자”란 회사가 제공하는 서비스를 사용하는 회원 및 비회원을 말합니다.

6. “아이디(ID, 이메일 주소)”란 회원 간 식별과 서비스 이용을 위해 회원이 선정하고 회사가 승인한 영문과 숫자 등의 조합을 말합니다.

7. “비밀번호(Password)"란 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로 설정하여 회사에 등록한 영문, 숫자 등의 조합을 말합니다.

8. “게시물”이란 “회원”이 서비스를 이용함에 있어 서비스 상에 게시판 부호, 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.

9. “가맹 디자이너”란 “회사”와 가맹계약을 맺고 정보통신단말기를 설치하여 회사가 제공하는 “서비스”를 이용해 “재화 등”에 관한 정보를 게재하고, 활동하는 주체를 말합니다. 회사 및 가맹점의 사정에 따라 해지 또는 추가될 수 있습니다. 단, 회사의 대리인이나 근로자로 간주되지 않습니다.

제 3조 약관의 명시와 설명 및 개정

1. 이 약관은 서비스를 이용하고자 하는 모든 이용자에 대하여 그 효력을 발생합니다.

2. “회사”는 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(이용자의 불만을 처리할 수 있는 주소를 포함함), 연락처, 모사전송번호, 전자우편주소, 사업자등록번호, 개인정보관리책임자 등을 이용자가 쉽게 확인할 수 있도록 “커먼”의 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 보도록 할 수 있습니다.

3. “회사”는 [전자상거래 등에서의 소비자보호에 관한 법률], [약관의 규제 등에 관한 법률], [전자문서 및 전자거래기본법], [전자서명법], [정보통신망 이용촉진 등에 관한 법률], [소비자기본법] 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

4. “회사”는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “커먼”의 초기 화면에 적용일자 7일(다만, 회원에게 불리한 내용으로 변경하는 경우에는 30일) 이전부터 적용일자 전일까지 공지합니다.

5. 제 4항에 의해 변경된 약관은 관련 법령에 특별한 규정 기타 부득이한 사유가 없는 한 그 적용일자 이전으로 소급하여 적용되지 아니합니다.

6. “회원”은 변경된 약관에 동의하지 않을 권리가 있으며, 변경된 약관에 동의하지 않을 경우에는 서비스 이용을 중단하고 탈퇴를 요청할 수 있습니다. 다만, “이용자”가 제 4항의 방법 등으로 “회사”가 별도 고지한 약관 개정 공지 기간 내에 “회사”에 개정 약관에 동의하지 않는다는 명시적인 의사표시를 하지 않는 경우 변경된 약관에 동의한 것으로 간주합니다.

7. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 “회사”에서 책임지지 않습니다.

제 4조 관련법령과의 관계

1. 이 약관 또는 개별약관에서 정하지 않은 사항은 전기통신사업법, 전자거래기본법 ,정보통신망법, 전자상거래 등에서의 소비자보호에 관한 법률, 개인정보보호법 등 관련 법령의 규정과 일반적인 상관례에 의합니다.

제 5조 서비스의 제공 및 변경

1. “회사”는 다음과 같은 서비스를 제공합니다.

(1) “재화 등”에 관련한 정보 제공 및 이용 중개 등 통신판매중개 서비스

(2) “재화 등”에 대한 광고플랫폼 서비스 관련 용역에 대한 정보 제공

및 구매계약 체결

(3) “재화 등”에 대한 판매 서비스

(4) 기타 “커먼”가 정하는 업무

2. “회사”는 서비스 제공과 관련한 회사 정책의 변경 등, 운영상, 기술상 변경 등, 큰 기타 문제가 발생할 경우 필요에 따라 제공하고 있는 “서비스”의 전부 또는 일부를 변경 또는 중단할 수 있습니다. 위 각 경우에는 변경된 재화 등의 내용 및 제공일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 즉시 공지합니다.

3. “커먼”의 내용, 이용방법, 이용시간에 대한 변경 또는 중단이 있는 경우에는 변경 또는 중단될 “커먼”의 내용 및 사유와 일자 등은 그 변경 또는 중단하기 전에 회사 “홈페이지” 또는 “커먼" 내 "공지사항" 화면 등 ”이용자“가 충분히 인지할 수 있는 방법으로 사전에 공지합니다. 다만, 회원 본인의 거래와 관련하여 서비스의 중단 등 중대한 영향을 미치는 사항에 대하여는 제 15조 제 1항에서 규정한 방법으로 개별 통지합니다.

제6조 서비스 이용시간 및 중단

1. “서비스” 이용은 “회사”의 업무상 기술상 특별한 지장이 없는 한 연중무휴를 원칙으로 하나 정보통신설비의 고장, 보수, 교체와 같은 정기 점검이 발생하거나 통신의 두절 등의 사유가 발생한 경우 서비스 이용을 제한하거나 일시적으로 중단 할 수 있습니다.

2. “회사”는 “서비스” 중단 시 사전에 공지하고 서비스를 중지할 수 있으나 불가피한 상황이 발생 시 사후에 통지할 수 있습니다.

제 7조 이용계약의 성립

1. “이용자”는 “회사”가 정한 약관의 내용에 동의를 하며 회원가입 신청을 합니다.

2. 제1항의 회원가입 신청에 “회사”가 승낙하여 “회원”이 되면서 이용계약이 성립합니다.

3. “회사”는 다음에 해당하는 신청에 대해서는 승인하지 않거나 추후에 이용계약을 해지할 수 있습니다.

(1) “이용자”가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우

(2) 타인의 명의를 이용한 경우

(3) 회사가 기타 사유로 실명확인절차를 실시할 경우 이용자의 실명이 허위로 드러난 경우

(4) 가입 정보에 허위 내용을 기재하거나 누락, 오기 등 사유가 발생할 경우

(5) 이미 가입된 이력의 정보가 있는 경우

(6) 부정한 방법으로 영리를 추구하는 경우

(7) 만 14세 미만 아동이 법정대리인의 동의 없이 가입한 경우

(8) 회사가 여러 가지 기타 사유로 해지가 필요하다고 판단하는 경우

4. “회사”는 기술이나 업무 등 내부 문제가 있는 경우에는 결정을 유보할 수 있습니다.

5. “회원”은 회원가입 시 등록한 정보에 변경이 발생할 경우, 일정 기간 이내 “회사”에게 회원정보 수정이나 연락을 통해 변경사항을 알려야 합니다.

제 8조 이용계약의 종료

1. “회원”의 해지

(1) “회원”은 “회사”에게 해지의사를 통지하여 이용계약을 해지할 수 있습니다.

(2) “회사”는 “회원”의 해지요청을 즉시 처리합니다. 단, 특별한 사정이 있을 시 유보할 수 있습니다.

(3) “회원”이 계약을 해지하는 경우 “프리너”가 운영하는 모든 서비스에 작성된 게시물은 삭제되지 않습니다.

2. “회사”의 해지

(1) “회사”는 다음과 같은 사유가 있는 경우 이용계약을 해지할 수 있습니다.

① 제7조 제3항과 같은 이용계약의 승낙거부사유를 확인한 경우

② “회원”이 다른 타인의 권리나 명예 등 정당한 이익을 침해하였다고 판단되는 경우

③ “회사”의 정책에 위배되는 행위를 하는 등 기타 해지사유가 발생한 경우

(2) “회사”는 ①, ②, ③과 같은 해지 사유 발생 시 “회원”에게 사전 통보 없이 계약을 해지할 수 있습니다. 계약 해지는 제 15조 제 1항에서 정한 통지 방법으로 합니다.

3. 해지에 관한 이의사항이 발생 시 “회사”의 고객센터로 문의가 가능합니다.

제 9조 회원의 ID 및 비밀번호에 대한 의무

1. 아이디와 비밀번호 등 개인정보에 관한 책임은 “회원”에게 있습니다.

2. “회원”은 자신의 아이디와 비밀번호를 제3자에게 제공하지 않습니다.

3. “회원”은 자신의 아이디와 비밀번호가 도난당하거나 제 3자가 이용하는 것을 인지한 즉시 “회사”에 통보하고 “회사”의 조치에 따릅니다.

4. “회원”이 제 3항에 따른 조치에 따르지 않을 시 모든 불이익과 책임은 “회원”이 집니다.

제 10조 회원 및 이용자의 의무

1. “이용자”는 “회사”가 제공하는 약관, 공지사항 등 모든 사항을 지켜야합니다.

2. “이용자”는 다음과 같은 행위를 하지 않습니다.

① 허위 내용을 등록

② 제 3자의 지적 재산권 침해하거나 명예를 손상시키거나 업무를 방해하는 행위

③ 폭력적인 메시지나 외설 등 미풍양속에 반하는 정보를 “서비스”에 공개하거나 게시

④ 고객센터 상담 시 욕설, 폭언, 성희롱 등에 해당하는 행위

⑤ 자신의 아이디와 비밀번호를 제 3자에게 제공 또는 대여하는 행위

⑥ 허위 게시물, 허위 리뷰 작성 등 사실과 관계없는 정보를 “서비스”에 게시하는 행위

⑦ 자동 접속 프로그램 등을 이용하여 부정한 방법으로 회사의 서버에 부하를 일으켜 회사의 정상적인 서비스를 방해하는 행위

⑧ 기타 관계법령에 위반되는 행위

제 11조 회원의 게시물

1. 게시물은 “회원”이 “서비스”를 이용함에 있어 게시한 모든 글, 댓글, 이미지, 동영상 등 모든 정보를 의미합니다.

2, “서비스”상에 작성한 모든 게시물은 회사가 필요할 경우 게시물에 대한 사용 권한과 사업적 협력관계에 있는 제 3자와 공유할 수 있는 권한을 가집니다. 단, 회사는 저작권법의 내용을 준수하며 게시물을 작성한 회원은 해당 게시물에 대한 삭제 요청 등의 조치를 취할 수 있습니다.

3. “회원”이 작성한 게시물에 대한 저작권 및 모든 책임은 이를 게시한 “회원”에게 있습니다. 등록한 게시물이 다음과 같이 해당된다고 판단 시 사전통지 없이 삭제할 수 있습니다.

① 광고성 게시물이나 스팸(spam)성 게시물

② 제 3자를 통하여 부당한 방법으로 허위 또는 과장한 게시물

③ 회원이 음란물을 게재하거나 링크를 기재한 게시물

④ 공공질서에 위반되는 내용의 게시물

⑤ 범죄에 관련된 게시물

⑥ 해당 페이지나 상품과 관련 없는 게시물

⑦ 정당한 사유 없이 “회사”나 “가맹점”을 비방하고자 기재한 게시물

⑧ 허위주문 또는 주문 취소 등 부당한 방법으로 기재한 게시물

⑨ 서비스에서 탈퇴한 “회원”이 기재한 게시물

⑩ 기타 회사가 판단하기에 부적절한 게시물

제 12조 회원게시물의 관리

1. “회원”의 “게시물”이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 “게시물”의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취해야합니다.

제 13조 이용제한 등

1. “회사”가 판단하기에 “이용자”가 약관의 의무를 위반하거나 운영을 방해한 경우, 일시정지, 영구정지, 계정삭제 등의 조치를 취할 수 있으며 모든 법적 책임은 “이용자”가 부담합니다.

2. 명의도용, 결제도용, 전화번호 도용, 저작권법, 악성프로그램 배포, 접속권한 초과행위, 불법통신 및 해킹 등 “정보통신망 이용촉진 및 정보보호 등에 관한 법률”, “여신전문금융업법”을 위반 시 모든 법적 책임은 “이용자”가 부담합니다.

3. 회사는 회원이 1년 이상 로그인하지 않은 경우, 이용을 제한할 수 있습니다.

4. 서비스 이용을 제한할 경우 제 15조[회원에 대한 통지]에 따릅니다.

5. “회원”은 “회사”의 결정 사항에 대해 이의 신청을 할 수 있으며 정당한 이의 신청으로 받아들여질 경우 “회사”는 즉시 서비스 이용을 재개합니다.

6. “이용자”의 귀책사유로 인해 서비스 이용이 제한된 경우, 서비스를 이용하며 획득한 혜택 등은 모두 소멸되며 “회사”는 이에 보상하지 않습니다.

제 14조 권리의 귀속

1. “서비스”에 대한 저작권 및 지적재산권은 모두 “회사”에 귀속됩니다.

2. “이용자”는 회사를 통해 얻은 정보를 이용해 이익을 취하지 않습니다.

제 15조 회원에 대한 통지

1. “회사”가 “회원”에게 공지나 통지가 필요한 경우 휴대폰번호나 이메일을 이용할 수 있습니다.

2. “회사”는 불특정다수의 “회원”에 대한 통지의 경우, 1주일 이상 서비스에 게시하여 개별 통지에 대해 갈음할 수 있습니다. 단, 회원 본인의 거래에 관하여 중대한 영향을 미치는 사항은 제 1항에서 규정한 방법으로 개별 통지합니다.

제 16조 “회사”의 의무

1. “회사”는 “이용자”가 안정적으로 “서비스”를 이용할 수 있도록 노력합니다.

2. “회사”는 “회원”의 개인정보처리방침을 수립하여 공시하고 준수합니다.

제 17조 개별 서비스에 대한 약관 및 이용정책

1. “회사”는 별도의 약관 및 이용정책을 둘 수 있으며, 별도로 적용되는 약관에 대한 동의는 “회원”이 개별서비스를 최초로 이용할 경우 별도의 동의 절차를 거치게 된다. 이 경우 개별 서비스에 대한 이용약관 등이 본 약관에 우선합니다.

2. “회사”는 개별 서비스에 대한 이용정책을 “서비스”를 통해 공지할 수 있고 “이용자”는 이용정책을 숙지하고 준수하여야 합니다.

제 18조 개인정보보호

1. “회사”는 “회원”의 개인정보를 보호하기 위하여 별도의 개인정보처리방침을 게시하였습니다.

2. “회사”는 “회원”의 개인정보를 보호하기 위한 개인정보 처리방침을 수립하여 서비스 초기화면에 게시합니다.

3. 개인정보처리방침을 확인할 책임 “회원”에게 있으며, “회사”는 이에 대하여 책임을 부담하지 않습니다.

제 19조 책임제한

1. “회사”는 다음의 사항에 대해 책임을 부담하지 않습니다. 단, “회사”의 고의 또는 중대한 과실이 인정되는 경우엔 그러지 아니합니다.

① 회사는 가맹 디자이너와 회원 간 거래를 중개할 뿐, 거래하는 당사자가 아니며, 상품에 대한 정보나 하자 등에 대한 책임은 가맹 디자이너에게 있습니다.

② “회사”는 “가맹 디자이너”나 “회원”이 게시한 리뷰, 평가, 사진 등에 관한 정보, 자료, 사실성, 정확성, 신뢰성 등에 대하여 책임을 지지 않습니다.

③ “회사”는 천재지변 또는 이에 준하는 불가항력으로 인하여 “서비스”를 제공할 수 없는 경우 서비스 제공에 관한 책임이 면제됩니다.

④ “회사”는 기간통신사업자 등 전기통신사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 못해 손해가 발생한 경우에 대해 회사의 고의 또는 중대한 과실이 없는 한 책임이 면제됩니다.

⑤ “회사”는 “회원”의 귀책사유로 인한 “서비스” 이용의 장애에 대하여는 책임을 지지 않습니다.

⑥ “회사”는 “회원”이 서비스를 이용하여 기대하는 이익에 미치지 못한 것과 서비스를 통하여 얻은 자료로 인한 손해에 대하여 책임지지 않습니다.

⑦ “회사”는 제 3자가 서비스 내 화면 또는 링크된 웹사이트를 통하여 광고한 제품 또는 서비스의 내용과 품질에 대하여 감시할 의무 등 책임을 지지 않습니다.

⑧ “회사”는 “회원”이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임지지 않습니다.

⑨ “회사”는 “회원”간 또는 “회원”과 제3자 상호간에 서비스를 이용해 거래 등을 한 경우에 책임지지 않습니다.

2. “회사”는 고의 또는 과실이 없는 한 다음과 같은 사항으로 부터 발생하는 손해에 대해 책임지지 않습니다.

① 회원 정보의 허위 또는 부정확성에 기인하는 손해

② 서비스에 대한 접속 및 서비스의 이용과정에서 “회원”의 귀책사유로 발생하는 손해

③ 서버에 대한 제 3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해 및 제 3자의 불법적인 행위를 방지하거나 예방하는 과정에서 발생하는 손해

④ 제 3자가 서비스를 이용하여 불법적으로 전송, 유포하거나 또는 전송 , 유포되도록 한 모든 바이러스와 같은 악성 프로그램으로 인한 손해

제 20조 분쟁해결

1. “회사”는 이용자가 제기하는 불만이나 정당한 의견을 반영하고 그 피해를 보상처리하기 위하여 고객 상담 채널을 운영합니다.

2. “회사”는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리하되, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 알려줍니다.

제 21조 준거법 및 관할법원

1. 이 약관의 해석 및 회사와 이용자 간의 분쟁에 대하여 대한민국의 법을 적용한다.

2 서비스 이용 중 발생한 이용자와 회사 간의 소송은 회사가 원하는 관할법원에 제소한다.

부칙

본 이용약관은 2022년 3월 1일에 개정되었으며, 2022년 3월 1일부터 시행됩니다.
          '''),
        ),
      ),
    );
  }
}
