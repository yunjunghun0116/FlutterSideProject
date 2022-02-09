# FlutterSideProject

**_1. Mealacle_**

**아이디어** : Mealkit+Miracle 코로나팬데믹의 장기화로 인해 변해버린 많은 사람들의 소비습관이 외식->집에서요리

**스택** : Flutter와 Firebase

**기능**

- [x] 음식을 장바구니에 담기
- [x] 최근 주문한상품 볼수있음
- [x] 카테고리별로 음식을 분류할수있다
- [x] 옵션별로 구분할 수 있다
- [x] 내정보 보기 - 주문내역과 알림을 볼 수 있다
- [x] 주문내역에서 음식으로 직접 접근또한 가능

1.  sharedPreference를 통해 장바구니에 기록, 유저정보 기록, 구매목록 저장
2.  가져온 음식목록을 구분
3.  가져온 orderList를 구분
4.  carousel-Slider를 이용한 광고화면띄우기
5.  장바구니에 저장한 음식의 유무에따라 화면을 다르게띄우기
6.  구매하기 스크린클릭시 바로 구매화면으로 넘어가게하기
7.  구매목록을 볼 수 있도록함

**고민한 부분**

1.  **어떻게 렌더링을 최소화할수있을까?** -> DetailScreen에서 count를 증가시켜줄때마다 DetailScreen전체가 렌더링되었고, count증가시켜주는부분은 BottomBar라는 커스텀위젯에서 다루어주었는데 이경우 메모리가 낭비될수도있다고 생각했다(고민시작하게된부분) -> BottomBar를 statefulWidget으로 만들어주고 필요한 정보 ex)count 등을 부모위젯과 서로 넘겨주며 제작함으로써 수정하니 count를 증가시켜주어도 리렌더링되지않았다.
2.  **어떻게 데이터통신을 최소화할수있을까?** -> 장바구니나 구매목록등의 화면을 띄워줄때 굳이 통신을 할필요가있나? 장바구니에 담기전에 이미 가져온 정보가있는데?라고 생각했다(고민시작하게된부분) -> foodId만 기록하는거보다 저장할때 좀더 많은정보를 저장하는것이(id만저장할때나 필요한정보몇개를 더 저장할때나 둘다 차지하는 양은 미미하기때문) 유리하지않을까? 라고 생각했다 -> 설계부분을 약간 수정해서 sharedPreference를 통해 장바구니목록을 기기가 갖고있을수있도록 설계하는데 그때 필요한 정보를 Map<string,dynamiv>의 List형태로 저장하기로 수정
3.  **어떻게 장바구니에 담는게 좋을까?** -> jsonEncode/Decode기능이 String을 응용하고있음을 알게되었다 -> sharedPreference에 StringList로 저장을 할 수 있다 -> String <-> Map 변환을 통해 데이터를 저장하고 변환

**_2. Common_**

**아이디어** : 다양한 대학생들의 모임을 연결시켜주는 플랫폼이자 타 대학교와 교류하기위한 커뮤니티 개발

**스택** : Flutter와 Firebase를 이용

**기능**

- [x] 모임 등록하기
- [x] 실시간 모임 보여주기
- [x] 모임 신청/수락/취소 하기
- [x] 대학교별로 카테고리구분해서 다양한 대학교의 모임을 구경가능
- [x] Kakao API를 사용해서 정확한 장소검색api지원
- [x] Naver sens를 통한 무분별한 회원가입 방지 - 한 휴대폰당 한 계정
- [x] 커뮤니티의 게시판 카테고리화

**고민한부분**

1. **어떻게 실시간데이터처럼 보여줄수 있을까?** -> GetBuilder와 GetController를 통해 데이터를 외부에서 관리해주고 받아와서 렌더링해줌으로써 실시간처럼 보여질수있도록
2. **대댓글을 어떤식으로 구현해야 유저도 만족할수있는 UI를 만들수있을까?** -> isRecomment 변수와 댓글/대댓글을 한 텍스트필드에서 사용함으로써(페이스북/에브리타임 참고) 유저친화적으로 대댓글작성가능
3. **시간이 지난 모임은 어떻게 처리해야 지금 신청가능한 모임들만 보여줄수있을까?** -> isOver변수를 공동사용하고 이를 query로써 사용해서 불러온다
