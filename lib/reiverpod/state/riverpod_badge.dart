import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/reiverpod/state/riverpod_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 2. 전역 변수 설계
// final badgeProvider =
//     NotifierProvider<RiverpodBadge, int>(() => RiverpodBadge());

// 위에 코드 축약버전
final badgeProvider =
NotifierProvider<RiverpodBadge, int>(RiverpodBadge.new);

// 1. 상태 클래스 만들기
// 다른 상태 클래스와 상호 작용
// [] <-- 카탈로그 리스트
class RiverpodBadge extends Notifier<int> {
  // 메모리에 올라 갈때 단 한번만 호출되는 메서드
  // Notifier - T state
  @override
  int build() {
    // 청취()
    List<Catalog> cartCatalogList = ref.watch(cartProvider);
    return cartCatalogList.length;
  }
// 상태 --> int (User), (String)
}
