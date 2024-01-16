// 카트 페이지 상세구성 클래스
// 버튼 클릭시 변경되는 변수값에 따라
// 이미지와 정보표시가 업데이트 되는 상태변경 위젯인
// Stateful 위젯(StatefulWidget)으로 구성한다!!!
// stf 단축키로 생성

import 'package:app_05_cart/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 상태관리위젯 상속한 메인 클래스 ///////
class CartDetail extends StatefulWidget {
  const CartDetail({Key? key}) : super(key: key);

  // 상태관리가 반영되게 하기 위한 재정의(클래스연결)
  @override
  State<CartDetail> createState() => _CartDetailState();
} ///////////// CartDetail 클래스 /////////////

// 상태관리에서 변경부분 반영을 위한 build메서드를
// 분리하여 반영하는 서브 클래스!!!
class _CartDetailState extends State<CartDetail> {
  // 선택된 버튼 순번을 저장하는 변수
  int sequenceNum = 0;
  // ->> 이 클래스 내부에서 선언하여 사용하는 변수의
  // 값이 변경되면 이 변수를 사용하는 위젯이 자동업데이트 된다!

  // 일반값 셋팅 변수
  // 이미지 리스트
  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  // 상품명 리스트
  List<String> selectedTit = [
    "Living bicycle",
    "Honda motorcycle",
    "Tesla Model3",
    "Cessna 150",
  ];
  // 상품정보 리스트 [ 가격, 조회수, 별수 ]
  Map<String, List> goodsInfo = {
    "Living bicycle": [699, 26, 5],
    "Honda motorcycle": [1700, 35, 7],
    "Tesla Model3": [7800, 98, 3],
    "Cessna 150": [12400, 75, 6],
  };

  // 빌드 재정의!!!
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1.상품이미지 : _buildPicture()
        _buildPicture(),
        // 2.선택버튼 : _buildSelector() -> _buildSelectButton()
        _buildSelector(),
        // 3.상품정보 : _buildCartInfo()
        // 상품명+상품가격+별점+리뷰수+색상옵션+버튼
        _buildCartInfo(),
      ],
    );
  }

  // 1.상품이미지생성 메서드 : _buildPicture()
  Widget _buildPicture() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          // 비율유지 박스내에 이미지를 넣는다!
          AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          // 위에 셋팅된 이미지를 호출!
          // List형 변수의 순번으로 상태변경클래스 내부 변수를
          // 사용하여 이 변수가 업데이트 되면 이미지도 변경됨!
          selectedPic[sequenceNum],
          // 비율박스에 이미지 맞게 채움설정
          fit: BoxFit.cover,
        ),
      ),
    );
  } /////////// _buildPicture 메서드 ///////////

// 2.선택버튼생성 메서드 : _buildSelector()
// -> _buildSelectButton() 호출
  Widget _buildSelector() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
        bottom: 30,
      ),
      child: Row(
        // 진행방향 균일간격
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 버튼 4개 생성하기
          _buildSelectButton(0, Icons.directions_bike),
          _buildSelectButton(1, Icons.motorcycle),
          _buildSelectButton(2, CupertinoIcons.car_detailed),
          _buildSelectButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  } //////////// _buildSelector 메서드 ////////

  // 선택버튼만들기 메서드 //////////
  Widget _buildSelectButton(int seq, IconData mIcon) {
    // seq변수 : 버튼 클릭시 변경할 순번변수값 셋팅
    // mIcon변수 : 버튼 아이콘
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        // 버튼 배경색상은 선택된것과 일반적인것으로 구분함
        // 현재 버튼하고 선택버튼순번과 같으면 엑센트색 넣기
        color: seq == sequenceNum ? kAccentColor : kSecondaryColor,
        // 둥근 모서리 셋팅
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          // 여기가 매우매우매우 중요함!!!
          // 버튼 클릭시 sequenceNum 변수값을 업데이트함
          // 그러면 이변수를 사용하는 모든 위젯이 업데이트됨!!!
          // 상태변수를 업데이트 하는 방법 :
          // ->  setState((){업데이트코드})
          setState(() {
            sequenceNum = seq;
          });
        },
      ),
    );
  } ////////// _buildSelectButton 메서드 ////////

  // 3.상품정보위젯 생성 메서드 : _buildCartInfo()
  // 상품명+상품가격+별점+리뷰수+색상옵션+버튼
  Widget _buildCartInfo() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        // 진행방향의 수직축(crossAxis)의 시작부분부터 정렬(왼쪽끝)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. 이름/가격 : _buildNamePrice()
          _buildNamePrice(),
          // 2. 별점/리뷰수 : _buildStarReview()
          _buildStarReview(),
          // 3. 옵션 : _buildOption()
          _buildOption(),
          // 4. 버튼 : _buildButton()
          _buildButton(),
        ],
      ),
    );
  } /////////////// _buildCartInfo 메서드 /////////

  // 1. 이름/가격 위젯 만들기 메서드 : _buildNamePrice()
  Widget _buildNamePrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        // 메인축 정렬 양쪽끝(사이간격만 주기)
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1.상품명 : selectedTit 리스트형 변수값 읽어옴
          // sequenceNum의 순번값이 변경될때 이것도 업데이트됨!!!
          Text(
            selectedTit[sequenceNum],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // 2. 상품가격 : selectedPrice
          Text(
            // 달러($)는 특수문자니까 역슬래쉬를 같이 씀!
            '\$${goodsInfo[selectedTit[sequenceNum]]?[0]}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  } ////////// _buildNamePrice  메서드 //////////

  // 2. 별점/리뷰수 위젯 만들기 메서드 : _buildStarReview()
  Widget _buildStarReview() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          // 여기에 for반복문을 쓰면 위젯을 반복할 수 있다!!!
          for (int i = 0; i < 7;i++) 
          Icon(Icons.star, color: Colors.pink),
        ],
      ),
    );
  } ////////// _buildStarReview  메서드 //////////

  // 3. 옵션 위젯 만들기 메서드 : _buildOption()
  Widget _buildOption() {
    return Padding(padding: const EdgeInsets.only(bottom: 10.0));
  } ////////// _buildOption  메서드 //////////

  // 4. 버튼 위젯 만들기 메서드 : _buildButton()
  Widget _buildButton() {
    return Padding(padding: const EdgeInsets.only(bottom: 10.0));
  } ////////// _buildButton  메서드 //////////
} ///////////// _CartDetailState 클래스 /////////
