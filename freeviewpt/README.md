# freeviewpt

- [ ] 이미지처리 어떤식으로? ex) 홈같은경우 apk는 asset으로 했지만 나중엔 모두 바꿔줘야함
- [ ] components - userLocationScreen은 구글맵가져와서 제대로 업데이트해주는식으로
- [ ] 찜하기방식 서버랑연결해서 +1 제대로해주기

- DB에 들어가야 할 컬렉션들
이달의 아트 (디자이너별로도 따로 이달의아트가 필요할듯)
디자이너(유저 role 0이냐 1이냐 만약 디자이너로 인증되면 따로 디자이너부분 컬렉션 간직)
디자인(가격 등등의 정보등이 필요 - 디자이너만 올릴수있음)
유저


- 해야할것
아티스트프로필 - 상세보기
위치
카테고리-스타일,가격,색상파트
채팅-어떤식의 디자인 스크린?

- 개발들어갈때

- 고민해볼정보
SliverPersistentHeader와 SliverPersistentHeaderDelegate를 이용해서 최상단에 앱을 고정시킬수있음
- 단점 : SliverToBoxAdapter로 모두 감싸준후 CustomScrollView를 사용해야함
- 무엇이 안좋은지 모른채 사용 -> 장단점 파악필요