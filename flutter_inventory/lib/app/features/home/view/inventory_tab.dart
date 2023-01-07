// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/features/home/view/inventory_screen.dart';
import 'package:flutter_inventory/app/stores/app_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InventoryTab extends StatelessWidget {
  const InventoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final _appStore = Modular.get<AppStore>();

    return Observer(builder: (_) {
      return InventoryScreen(inventory: _appStore.inventory);
    });
  }
}
