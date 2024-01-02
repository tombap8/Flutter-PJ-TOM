import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  // 앱 빌드 위젯 재정의!
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 디버그 모드 지우기
      debugShowCheckedModeBanner: false,
      // 테마를 위한 클래스를 만들고 불러오기
      
    );
  }
}
