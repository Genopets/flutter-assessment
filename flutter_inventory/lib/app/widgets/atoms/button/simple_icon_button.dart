import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class SimpleIconButton extends StatefulWidget {
  const SimpleIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.preset = ColorPresets.teal,
    this.size = 900,
    this.elevation = 0,
    this.padding,
  }) : super(key: key);

  final void Function()? onPressed;
  final ColorPresets preset;
  final bool disabled;

  final double size;
  final double elevation;

  final bool isLoading;
  final EdgeInsets? padding;

  final Widget icon;
  @override
  _SweetButtonState createState() => _SweetButtonState();
}

class _SweetButtonState extends State<SimpleIconButton> {
  Widget _buildView(
    BuildContext context,
    Color color,
    LinearGradient gradient,
    ThemeDataT theme,
  ) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(360),
      ),
      padding: widget.padding ?? EdgeInsets.zero,
      child: Center(
        child: widget.icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final gradient = widget.disabled
        ? theme.colors.background.grey
        : theme.gradient(widget.preset);

    final color = widget.disabled
        ? theme.colors.primary.grey
        : theme.primaryColor(widget.preset);

    return Material(
      color: Colors.transparent,
      elevation: widget.elevation,
      borderRadius: BorderRadius.circular(360),
      shadowColor: color.withOpacity(0.2),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(360),
        child: _buildView(context, color, gradient, theme),
      ),
    );
  }
}
