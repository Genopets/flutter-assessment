import 'dart:convert';
import 'dart:developer';

import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/domain/entities/item_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pocketbase/pocketbase.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

//TODO To test android change the Localhost to
//http://10.0.2.2:8090
const host = 'http://127.0.0.1';
final pb = PocketBase('$host:8090');

const genoAPI = '$host:8080';
const genoAPIInventory = '$genoAPI/api/v1/inventory/gifts';

abstract class _AppStore with Store, Disposable {
  _AppStore() {
    getData();
  }
  Future<void> getSomeGifts(final int qty) async {
    final response = await http.post(Uri.parse(genoAPIInventory),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'numberOfgifts': qty,
        }));
    log('** Response from API: $response');
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
              inventoryItem: item,
              inventoryId: element.id);
          tempInventory.add(inventoryEntity);
        }
      }

      inventory.addAll(tempInventory);
    });

    await pb.collection('inventory').subscribe('*', (e) async {
      final newInventoryObject = e.record!.toJson();
      final item = globalItemsMap[newInventoryObject['item'] as String];
      if (item != null) {
        final imageUrl = await item.getImageUrl();
        final newInventoryEntity = InventoryEntity(
            imageUrl: imageUrl,
            quantity: newInventoryObject['qty'] as int,
            inventoryItem: item,
            inventoryId: newInventoryObject['id'] as String);

        for (var i = 0; i < inventory.length; i++) {
          if (inventory[i].inventoryId == newInventoryEntity.inventoryId) {
            inventory[i] = newInventoryEntity;
            return;
          }
        }
        inventory.add(newInventoryEntity);
      }
    });
  }

  @observable
  Map<String, ItemEntity> globalItemsMap = {};

  @observable
  ObservableList<InventoryEntity> inventory =
      ObservableList<InventoryEntity>.of([]);

  @override
  void dispose() {
    globalItemsMap = {};
    inventory.clear();
    pb.collection('inventory').unsubscribe();
  }
}
