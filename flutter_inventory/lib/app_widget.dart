import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/features/home/view/inventory_tab.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenopetsTheme(
      data: genopetDarkTheme,
      child: const MaterialApp(
        home: InventoryTab(key: Key('Inventory')),
      ),
    );
  }
}
