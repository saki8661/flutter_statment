import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {

  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index){
        // 넘겨받은 리스트 중에 하나의 오브젝트이다.
        Catalog catalog = catalogListSample[index];

       return CatalogItem(
           catalog: catalog,
           // 임시 수정 (코드 변경 예정)
           isInCart: false,
           onPressedCatalog: (catalog){});
      }
    );
  }
}
