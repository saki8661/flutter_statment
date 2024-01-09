import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/reiverpod/state/riverpod_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatalogWidget extends ConsumerWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: catalogListSample.length,
        itemBuilder: (context, index) {
          // 넘겨받은 리스트 중에 하나의 오브젝트이다.
          Catalog catalog = catalogListSample[index];

          return CatalogItem(
              catalog: catalog,
              // 임시 수정 (코드 변경 예정)
              // ref.watch(cartProvider) -->
              isInCart: ref.watch(cartProvider).contains(catalog), // t or f
              onPressedCatalog:
                  ref.read(cartProvider.notifier).onCatalogPressed);
        });
  }
}
