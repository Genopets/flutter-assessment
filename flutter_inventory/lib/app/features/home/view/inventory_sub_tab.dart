import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/features/home/view/inventory_list_item.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/domain/entities/inventory_entity.dart';

class InventorySubTab extends StatelessWidget {
  const InventorySubTab({super.key, required this.inventoryToDisplay});

  final List<InventoryEntity> inventoryToDisplay;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.sizes.scale400),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: inventoryToDisplay
              .asMap()
              .entries
              .map((entry) => InventoryListItem(
                    index: entry.key,
                    length: inventoryToDisplay.length,
                    inventoryEntity: entry.value,
                  ))
              .toList()),
    );
  }
}
