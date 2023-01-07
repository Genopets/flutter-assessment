import 'package:flutter/material.dart';
import 'package:flutter_inventory/app_module.dart';
import 'package:flutter_inventory/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
