import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class ButtonGroupItem {
  ButtonGroupItem({this.icon, required this.text, this.onPressed});

  final Widget? icon;
  final Widget text;
  final void Function()? onPressed;
}

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({
    Key? key,
    required this.children,
    this.onPress,
    this.disabled = false,
    this.isLoading = false,
    this.preset = ColorPresets.teal,
    this.itemHeight = 85,
    this.elevation = 0,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  final void Function()? onPress;
  final ColorPresets preset;
  final bool disabled;

  final double itemHeight;
  final double elevation;

  final bool isLoading;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  final List<ButtonGroupItem> children;

  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  Widget _iconContent(ButtonGroupItem item) {
    if (item.icon == null) return const SizedBox.shrink();

    return SizedBox(
      width: 25,
      height: 25,
      child: FittedBox(child: item.icon),
    );
  }

  Widget _buildView({
    required ButtonGroupItem item,
    required BuildContext context,
    required Color color,
    required LinearGradient gradient,
    required ThemeDataT theme,
    required int index,
    required int len,
  }) {
    const rad = Radius.circular(15);
    final side = BorderSide(color: color.withOpacity(0.5));

    final BorderRadius borderRadius;
    final Border border;
    if (index == 0) {
      borderRadius = const BorderRadius.only(topLeft: rad, topRight: rad);
      border = Border(
        top: side,
        left: side,
        right: side,
      );
    } else if (index == (len - 1)) {
      borderRadius = const BorderRadius.only(bottomRight: rad, bottomLeft: rad);
      border = Border(
        bottom: side,
        left: side,
        right: side,
      );
    } else {
      borderRadius = BorderRadius.zero;
      border = Border.all(
        color: color.withOpacity(0.5),
      );
    }

    return Material(
      color: Colors.transparent,
      elevation: widget.elevation,
      borderRadius: borderRadius,
      shadowColor: color.withOpacity(0.4),
      child: InkWell(
          onTap: item.onPressed,
          borderRadius: borderRadius,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              height: widget.itemHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                border: border,
                gradient: gradient,
              ),
              padding: widget.padding ??
                  EdgeInsets.symmetric(
                    horizontal: theme.sizes.scale800,
                    vertical: theme.sizes.scale400,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconContent(item),
                  SizedBox.fromSize(
                    size: const Size.fromWidth(12),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: item.text,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final gradient = widget.disabled
        ? theme.colors.background.grey
        : theme.backgroundGradient(widget.preset);
    final color = widget.disabled
        ? theme.colors.primary.grey
        : theme.primaryColor(widget.preset);

    final items = <Widget>[];
    for (var i = 0; i < widget.children.length; i++) {
      items.add(_buildView(
        item: widget.children[i],
        context: context,
        color: color,
        gradient: gradient,
        theme: theme,
        index: i,
        len: widget.children.length,
      ));
    }

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}
