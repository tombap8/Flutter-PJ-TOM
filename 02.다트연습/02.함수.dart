void main(List<String> args) {
  // [다트의 함수]
  // - 특정실행코드를 호출시 실행하기 위한
  // 코드 저장소!
  /* 
    1. 일반함수
    형식: 
      데이터형 함수명(전달변수){코드구역}
      - 데이터형 : 함수에서 값을 리턴할 데이터형
        -> 리턴값이 없는 함수는 반드시 void 라고 써줘야한다!
      - 전달변수 : 데이터형과 함께 변수로 표현
    
    예) int myFn (int aa){return aa + 100;}
    -> 정수형숫자를 받아서 100을 더한후 int형으로 리턴
   */

  
  showTxt('이순신에 대해 알아볼까요?');
  showTxt('이순신의 마지막 전투는? ${leeFight[2]}${detail[leeFight[2]]}');
  showTxt(makeSubTit(2));
  showTxt(makeSubTit(1));
  showTxt(makeSubTit(0));

  // [ 다트의 널 세이프티(Null Safety) ]
  // - 개발자가 null 데이터가 생길 경우 에러를 막기 위한
  // 조치를 다트언어에서 시스템적으로 처리해주는 기법
  // 1. 널체크 연산자 : ? - 널값 여부체크
  // 2. 널병합 연산자 : ?? - 널인경우 뒤에 쓴값 출력





} // main /////


// [ 다트의 상수 : final, const ] -> 함수바깥이면 전역변수
  final leeFight = ['명량','한산','노량'];
  const detail = {'명량':'해전','한산':'도대첩','노량':'해전'};
  final subTit = {'명량':null,'한산':'용의 출현','노량':'죽음의 바다'};


// 텍스트 찍기 함수
void showTxt(var txt){
  print(txt);
}

// 이순신 시리즈 영화 부제목 찍기 함수
// 리턴값의 형은? String
// 전달값은 List상수의 순번값을 받음
String makeSubTit(int seq){
  return
  '이순신의 마지막 전투는? ${leeFight[seq]}${detail[leeFight[seq]]}';
} /////// makeSubTit 함수 /////////

