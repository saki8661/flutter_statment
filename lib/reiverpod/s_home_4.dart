import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

// 상태관리 Stateful과 콜백으로
// 상태가 있는 위젯 생성
class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  // 현재 성택된 index
  int currentIndex = 0;


  // 샘플데이터 (localDB, 통신)
  late List<Catalog> responseListData;

  @override
  void initState() {
    super.initState();
    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안된다.(버그발생)
    // 가능한 데이터 초기화 처리만 사용하자.
    responseListData = catalogListSample;
  }

  @override
  Widget build(BuildContext context) {
    //
    print("HomeScreen build() 함수 호출");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Catalog"),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          CatalogWidget(),
          CartWidget(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        // 코드 수정 예정
        cartTotal: '${0}',
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
