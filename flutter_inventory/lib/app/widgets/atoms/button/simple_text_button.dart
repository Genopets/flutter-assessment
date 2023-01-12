import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/widgets/atoms/tab/rectangular_button.dart';

class SimpleTextButton extends StatelessWidget {
  const SimpleTextButton(this.text,
      {super.key,
      this.onTap,
      this.icon,
      this.selected = false,
      this.useStrongOpacity = false});
  final Function()? onTap;
  final String text;
  final String? icon;
  final bool selected;
  final bool useStrongOpacity;

  @override
  Widget build(BuildContext context) {
    return RectangularButton(
        useStrongOpacity: useStrongOpacity,
        icon: icon,
        title: text,
        onTap: onTap,
        selected: selected);
  }
}
