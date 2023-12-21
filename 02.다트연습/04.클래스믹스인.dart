// 다트 클래스 믹스인(다중상속) ////
/**************************************************** 
 * [다트 Mixin 이란?]
 * 다중 상속이 필요할 때 mixin을 사용함
 * mixin은 다른 코드에 더해질 목적으로 만들어진 클래스임
 * with 키워드는 클래스에 mixin 클래스를 사용할때 씀
 * 
 * 형식 : 
 * mixin 클래스명{}
 * 또는
 * mixin class 클래스명{}
 * -> class 키워드를 안쓰면 믹스인 전용클래스
 * -> class 키워드를 쓰면 개별 인스턴스 사용가능함!
 * 
 * [ 믹스인 사용클래스 형식 ]
 * class 클래스명 with 믹스인클래스,믹스인클래스,...{}
****************************************************/
void main(List<String> args) {

  // 테슬라 자동차 인스턴스 생성하기!
  Tesla tesla = new Tesla('테슬라', 'Model 3', 6350.0);

  print('전기자동차 회사이름: ${tesla.compName}');
  print('🚗모델명: ${tesla.model}');
  print('🚗가격: ${tesla.price}만원');
  print('🚗주행거리: ${tesla.distance}km');
  print('🚗엔진정보: ${tesla.power}마력');
  print('🚗바퀴정보: ${tesla.wheelInfo}');
  print('🚗라이트정보: ${tesla.luminosity}lux');
  
} ////////// main ////////////////

// 전기자동차 회사인 테슬라의 부품을 조달하도록 믹스인한다!
class Tesla with Engine, Wheel, Light {
  // 회사명
  final String compName;
  // 자동차 모델명
  final String model;
  // 가격
  final double price;
  // 주행거리
  double distance = 480.0;

  // 생성자 - 입력받을 속성값 셋팅!
  Tesla(this.compName,this.model,this.price);
} /////////// Tesla 클래스 ////////////

// 믹스인 클래스 : 엔진파트
mixin Engine{
  // 엔진마력수
  int power = 5000;
}

// 믹스인 클래스 : 바퀴파트
mixin Wheel {
  // 바퀴정보
  String wheelInfo = "광폭4륜구동바퀴";
}
// 믹스인 클래스 : 라이트파트
mixin Light {
  // 광도
  double luminosity = 3000.0;
}

