import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

import 'f_cart.dart';
import 'f_catalog.dart';

// 상태가 있는 위젯 생성
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {

  // 현재 성택된 index
  int currentIndex = 0;
  // 선택된 카탈로그 정보를 담을 수 있는 자료 구조 선언
  List<Catalog> catalogList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Catalog"),
      ),
      body: IndexedStack(
        children: [
          CatalogWidget(),
          CartWidget(),
        ],
      ),
    );
  }
}
