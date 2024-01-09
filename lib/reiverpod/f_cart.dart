import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/reiverpod/state/riverpod_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/models/vo_catalog.dart';

// 활용하는 방법
// 1. StatelessWidget -> ConsumerWidget 변경 하기
class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  // 2. WidgetRef ref 추가
  Widget build(BuildContext context, WidgetRef ref) {
    // 사태 관리 데이터가 변경 되었는지 계속 확인 해야 한다. -> 구독처리
    // 전역 변수로 셋팅
    // -> State -> List<Catalog>
    List<Catalog> cartProviderList = ref.watch(cartProvider);

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: cartProviderList.length,
            itemBuilder: (context, index) {
              // 하나에 오브젝트만 뽑자.
              Catalog catalog = cartProviderList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  // 임시 코드 추가(추후 변경 예정)
                  // ref.read(cartProvider.notifier --> ReiverpodCart
                  onPressedCatalog:
                      ref.read(cartProvider.notifier).onCatalogPressed);
            },
          ),
        ),
        // 구분선
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        // 합계 - 텍스트
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${cartProviderList.length}',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
