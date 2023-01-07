import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/domain/entities/item_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store, Disposable {
  _AppStore() {}

  @observable
  Map<String, ItemEntity> globalItemsMap = {};

  @observable
  List<InventoryEntity> inventory = [];

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
