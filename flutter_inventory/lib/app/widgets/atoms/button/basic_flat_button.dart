import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/widgets/atoms/icons/svg_icon.dart';

// Basic button to display elements with no background
class BasicFlatButton extends StatelessWidget {
  const BasicFlatButton({
    Key? key,
    this.icon,
    this.label,
    this.onPressed,
    this.height,
    this.width,
    this.iconColor,
    this.padding = 0,
    this.aligment = CrossAxisAlignment.center,
    this.iconSize = 48,
    this.color,
  }) : super(key: key);

  // Elements to render
  final String? icon;
  final String? label;

  // Functions
  final void Function()? onPressed;

  // Sizes
  final double? height;
  final double? width;
  final double iconSize;
  final double padding;

  // Styling
  final CrossAxisAlignment aligment;
  final Color? iconColor;
  final Color? color;

  // Render icon if not null
  Widget _renderIcon() {
    if (icon == null) return Container();
    return SizedBox(
      child: SvgIcon(icon!, color: iconColor, size: iconSize),
    );
  }

  // Render label if not null
  Widget _renderLabel() {
    if (label == null) return Container();
    return Text(
      label!,
      style: TextStyle(letterSpacing: 5, color: color),
      textDirection: TextDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: SizedBox(
        height: height ?? 90,
        width: width ?? 90,
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            crossAxisAlignment: aligment,
            children: [_renderIcon(), _renderLabel()],
          ),
        ),
      ),
    );
  }
}
