import 'package:riverpod/riverpod.dart';

import '../../common/models/vo_catalog.dart';

// 포인트 - 리버팟은 상태클래스와 상태 변경 로직 클래스를 분리한다.

// 2 - 전역 변수 설계 : 상태변경(접근)로직 담당
final cartProvider = NotifierProvider<RiverpodCart, List<Catalog>>((){
  return RiverpodCart();
});


// 1 - 상태 클래스에 설계
class RiverpodCart extends Notifier<List<Catalog>>{

  // build()는 Notifier 객체가 처음 생성될 때 한 번 호출 되어 상태를 설정 합니다.(state)
  // 내부에서 T _state; 가 있다.

  @override
  List<Catalog> build() {
    return [];
  }

  // 행위
  void onCatalogPressed(Catalog catalog){
    // 아래 로직이 적절한가? - 얕은 복사 개념
    // 동작하지 않음 깊은 복사로 바꾸어야한다
    // if(state.contains(catalog)) {
    //   // 리스트에서 삭제 처리
    //   state.remove(catalog);
    // }else{
    //   state.add(catalog);
    // }

    // 깊은 복사 수정
    if (state.contains(catalog)) {
      state = state.where((element) {
        return element != catalog;
      }).toList();
    } else {
      state = [...state, catalog];
    }
  }
}