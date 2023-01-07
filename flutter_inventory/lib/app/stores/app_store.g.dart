// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$globalItemsMapAtom =
      Atom(name: '_AppStore.globalItemsMap', context: context);

  @override
  Map<String, ItemEntity> get globalItemsMap {
    _$globalItemsMapAtom.reportRead();
    return super.globalItemsMap;
  }

  @override
  set globalItemsMap(Map<String, ItemEntity> value) {
    _$globalItemsMapAtom.reportWrite(value, super.globalItemsMap, () {
      super.globalItemsMap = value;
    });
  }

  late final _$inventoryAtom =
      Atom(name: '_AppStore.inventory', context: context);

  @override
  List<InventoryEntity> get inventory {
    _$inventoryAtom.reportRead();
    return super.inventory;
  }

  @override
  set inventory(List<InventoryEntity> value) {
    _$inventoryAtom.reportWrite(value, super.inventory, () {
      super.inventory = value;
    });
  }

  @override
  String toString() {
    return '''
globalItemsMap: ${globalItemsMap},
inventory: ${inventory}
    ''';
  }
}
