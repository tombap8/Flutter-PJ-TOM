import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* 
  [ 로그인 앱 전체구성 : lib하위 ]
  - 메인 출발(추가 사이즈지정 size.dart)
  - 페이지구성 : 2개
    pages / home_page.dart : 홈 페이지
    pages / login_page.dart : 로그인 페이지
  - 컴포넌트 구성 : 3개
    components / logo.dart : SVG로고
    components / custom_form.dart : Form 위젯
    components / custom_text_form_field.dart : Form요소 위젯
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
