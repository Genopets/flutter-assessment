import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/lines/lines.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key? key,
    this.child,
    this.colorPreset = ColorPresets.teal,
    this.gradient,
    this.useBottomLeftRadius = true,
    this.circuitLineHeight,
    this.leftCiruitLine = true,
    this.rightCircuitLine = true,
  }) : super(key: key);

  final Widget? child;
  final LinearGradient? gradient;
  final ColorPresets colorPreset;
  final bool useBottomLeftRadius;
  final double? circuitLineHeight;
  final bool leftCiruitLine;
  final bool rightCircuitLine;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final themeGradient = theme.gradient(colorPreset);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(35),
          bottomLeft:
              useBottomLeftRadius ? const Radius.circular(35) : Radius.zero,
          bottomRight: const Radius.circular(35),
        ),
        border: Border.all(
          color: theme.opacityColor(colorPreset),
        ),
        gradient: gradient ??
            LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: themeGradient.colors,
            ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          if (rightCircuitLine)
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                height: circuitLineHeight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: CircuitCurvedLine(
                      size: Size(40.88, circuitLineHeight ?? double.maxFinite),
                      colorPreset: colorPreset,
                    ),
                  ),
                ),
              ),
            ),
          if (leftCiruitLine)
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: circuitLineHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircuitCurvedLine(
                    size: Size(40.88, circuitLineHeight ?? double.maxFinite),
                    colorPreset: colorPreset,
                  ),
                ),
              ),
            ),
          if (child != null) child!
        ],
      ),
    );
  }
}
