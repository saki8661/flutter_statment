import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/reiverpod/state/riverpod_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

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
    // 위젯 트리에 등록
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Catalog"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            // 재빌드되면 소용없기 때문에 const필요
            CatalogWidget(),
            CartWidget(),
          ],
        ),
        // 특정 부분만 렌더링 하고 싶다면
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) => BottomBar(
            currentIndex: currentIndex,
            // 코드 수정 예정
            cartTotal: '${ref.watch(badgeProvider)}',
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
