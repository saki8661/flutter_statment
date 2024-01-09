import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시 코드 추가
    List<Catalog> cartList = [];
    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              // 하나에 오브젝트만 뽑자.
              Catalog catalog = cartList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  // 임시 코드 추가(추후 변경 예정)
                  onPressedCatalog: (catalog) {});
            },
          ),
        ),
        // 구분선
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        // 합계 - 텍스트
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${cartList.length}',
              style: TextStyle(
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
