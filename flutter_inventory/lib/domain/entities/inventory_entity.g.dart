// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryEntity _$InventoryEntityFromJson(Map<String, dynamic> json) =>
    InventoryEntity(
      inventoryItem:
          ItemEntity.fromJson(json['inventoryItem'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      imageUrl: json['imageUrl'] as String,
      inventoryId: json['inventoryId'] as String,
    );

Map<String, dynamic> _$InventoryEntityToJson(InventoryEntity instance) =>
    <String, dynamic>{
      'inventoryItem': instance.inventoryItem,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'inventoryId': instance.inventoryId,
    };
