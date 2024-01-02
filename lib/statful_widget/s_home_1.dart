import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

// 상태관리 Stateful과 콜백으로
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
  List<Catalog> catalogList = [
    // Catalog.name(color: Colors.red, title: "테스트 아이템1"),
    // Catalog.name(color: Colors.orange, title: "테스트 아이템2"),
  ];

  // 샘플데이터 (localDB, 통신)
  late List<Catalog> responseListData;
  @override
  void initState() {
    super.initState();
    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안된다.(버그발생)
    // 가능한 데이터 초기화 처리만 사용하자.
    responseListData = catalogListSample;
  }

  // 콜백받을 메서드 선언
  void onPressedCatalog(Catalog catalog){
    print("여기 HomeScreen 위젯 이벤트 발생");
    // 콜백이 일어나면 UI 업데이트 처리
    setState(() {
      if(catalogList.contains(catalog)) {
        // 리스트에 object 포함 하고 있다면 삭제 처리
        catalogList.remove(catalog);
      }else{
        catalogList.add(catalog); // add 처리
      }
    });
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
          CatalogWidget(
            responseListData: responseListData,
            catalogList: catalogList,
            onPressedCatalog: onPressedCatalog,
          ),
          CartWidget(
            catList: catalogList,
            onPressedCatalog: onPressedCatalog,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: '${catalogList.length}',
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
