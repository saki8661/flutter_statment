import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  // 통신을 통해 받은 데이터가 필요함
  final List<Catalog> responseListData;

  // 내 카트에 담은 데이터 정보 필요
  final List<Catalog> catalogList;
  final void Function(Catalog catalog) onPressedCatalog;

  const CatalogWidget({super.key,
    required this.responseListData,
    required this.catalogList,
    required this.onPressedCatalog});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: responseListData.length,
      itemBuilder: (context, index){
        // 넘겨받은 리스트 중에 하나의 오브젝트이다.
        Catalog catalog = responseListData[index];

       return CatalogItem(
           catalog: catalog,
           isInCart: catalogList.contains(catalog),
           onPressedCatalog: onPressedCatalog);
      }
    );
  }
}
