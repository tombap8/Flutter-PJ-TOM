// 황금 레시피 페이지홈 클래스 ////

import 'package:flutter/material.dart';

// 레시피 컴포넌트 불러오기 : 타이틀, 메뉴, 리스트아이템
import 'package:app_02_recipe/components/recipe_title.dart';
import 'package:app_02_recipe/components/recipe_menu.dart';
import 'package:app_02_recipe/components/recipe_list_item.dart';

class RecipePage extends StatelessWidget {
  // 생성자 메서드에서 key를 받아서 부모 속성을 셋팅함
  // key는 이미만들어진 부모위젯에서 받는 기본값
  // 이 값은 우리가 넘겨주지 않아도 셋팅은 되어야함!
  const RecipePage({Key? key}) : super(key: key);
  // Key? key -> Key클래스 형 변수 key가 null이어도
  // 그 값을 null처리 하지 않고 "null"문자열로 처리해줌!
  // -> 널 세이프티(null safety)라고 한다!(물음표사용!)

  // build 메서드를 재정의함!
  @override
  Widget build(BuildContext context) {
    // 가장 바깥쪽 레이아웃 Scaffold 위젯으로 시작!
    return Scaffold(
      // 전체 배경색 설정하기
      backgroundColor: Color.fromARGB(189, 3, 168, 8),
    );
  }
}
