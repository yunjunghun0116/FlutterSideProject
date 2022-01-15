# Mealacle

개선사항
1. 스크린마다 sharedPreference를 계속 부르는것을 싱글톤디자인패턴을 적용시켜 DatabaseController객체를 생성후 스크린에서 이 객체를 호출하는 방식으로 계속적인 객체생성이 아닌 호출만으로 시간을 단축시킬수있었다
2. models -> Food모델을 사용함으로써 데이터를 관리하기 좀더 편하고, 타입을 설정함으로써 에러를 줄일수있다.
3. food['id'] 와같이 사용하던걸 food.fromStorageMap처럼 팩토리디자인으로 편하게 작업할수있도록 코드를 편하게만들었다. - 안되던이유는 fromMap과 fromStorageMap의 차이(key의 null값)때문이었다.
