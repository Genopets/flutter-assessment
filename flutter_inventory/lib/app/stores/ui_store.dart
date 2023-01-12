import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'ui_store.g.dart';

class UiStore = _UiStore with _$UiStore;

abstract class _UiStore with Store, Disposable {
  _UiStore();
  @observable
  int qty = 1;

  @override
  void dispose() {
    qty = 1;
  }
}
