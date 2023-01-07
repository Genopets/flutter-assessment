import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class OutlinedGradientCircle extends StatelessWidget {
  OutlinedGradientCircle({Key? key, required this.child}) : super(key: key);

  final Widget child;

  final BoxDecoration kGradientDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [Colors.purple, Colors.yellow]));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GenopetsTheme.of(context).sizes.scale400),
      decoration: kGradientDeco,
      child: child,
    );
  }
}
