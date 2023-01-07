import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_svg/svg.dart';

/// Helper widget for rendering SVGs
///
/// You can use the default SVG color by passing null to preset
class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.icon, {
    Key? key,
    this.size = 24,
    this.color,
    this.preset = ColorPresets.teal,
    this.allowDrawingOutsideViewBox = true,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String icon;
  final double size;
  final Color? color;
  final ColorPresets? preset;
  final bool allowDrawingOutsideViewBox;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    final _color =
        color ?? (preset != null ? theme.primaryColor(preset!) : null);

    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        icon,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        fit: fit,
        color: _color,
        height: size,
        width: size,
      ),
    );
  }
}
