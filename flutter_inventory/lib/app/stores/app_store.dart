import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/domain/entities/item_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocketbase/pocketbase.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

final pb = PocketBase('http://127.0.0.1:8090');

abstract class _AppStore with Store, Disposable {
  _AppStore() {
    getData();
  }

  Future<void> getData() async {
    await pb.collection('items').getFullList().then((value) {
      for (final element in value) {
        final item = ItemEntity.fromJson(element.data);
        globalItemsMap[element.data['itemId'] as String] = item;
      }
    });

    await pb.collection('inventory').getFullList().then((value) async {
      final tempInventory = <InventoryEntity>[];

      for (final element in value) {
        final item = globalItemsMap[element.data['item'] as String];

        if (item != null) {
          final imageUrl = await item.getImageUrl();
          final inventoryEntity = InventoryEntity(
              imageUrl: imageUrl,
              quantity: element.data['qty'] as int,
              inventoryItem: item);

          tempInventory.add(inventoryEntity);
        }
      }

      inventory = tempInventory;
    });
  }

  @observable
  Map<String, ItemEntity> globalItemsMap = {};

  @observable
  List<InventoryEntity> inventory = [];

  @override
  void dispose() {
    globalItemsMap = {};
    inventory = [];
  }
}
