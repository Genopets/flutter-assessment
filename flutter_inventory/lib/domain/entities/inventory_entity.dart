import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/domain/entities/item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_entity.g.dart';

final colorPresets = {
  'FOOD': ColorPresets.yellow,
  'TOY': ColorPresets.orange,
  'BOOST': ColorPresets.purple,
  'AUGMENT': ColorPresets.blue,
  'CRYSTALS': ColorPresets.teal,
  'REAGENT': ColorPresets.pink,
};

class InventoryDisplaySettings {
  InventoryDisplaySettings({
    required this.preset,
    required this.primaryColor,
    required this.textColor,
    required this.gradient,
  });

  final ColorPresets preset;
  final Color primaryColor;
  final Color textColor;
  final LinearGradient gradient;
}

@JsonSerializable()
@immutable
class InventoryEntity {
  const InventoryEntity(
      {required this.inventoryItem,
      required this.quantity,
      required this.imageUrl,
      required this.inventoryId});
  factory InventoryEntity.fromJson(Map<String, dynamic> json) =>
      _$InventoryEntityFromJson(json);

  final ItemEntity inventoryItem;
  final int quantity;
  final String imageUrl;
  final String inventoryId;

  Map<String, dynamic> toJson() => _$InventoryEntityToJson(this);

  InventoryDisplaySettings getDisplaySettings(ThemeDataT theme) {
    final preset =
        colorPresets[inventoryItem.type.toUpperCase()] ?? ColorPresets.teal;

    final primaryColor = theme.primaryColor(preset);

    final textColor = theme.textColor(preset);

    final gradient = theme.hudGradient(preset);

    return InventoryDisplaySettings(
      preset: preset,
      primaryColor: primaryColor,
      textColor: textColor,
      gradient: gradient,
    );
  }
}
