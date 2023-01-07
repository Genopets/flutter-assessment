import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';

@immutable
abstract class BaseTheme {
  const BaseTheme({
    this.colorPreset = ColorPresets.teal,
  });

  final ColorPresets colorPreset;
}

@immutable
class TypewriterFrameTheme extends BaseTheme {
  const TypewriterFrameTheme({
    this.color = Colors.black54,
    this.lineColor = const Color.fromRGBO(0, 255, 200, 1),
    this.lineStroke = 1.0,
    this.cornerStroke = 3.0,
    this.cornerLengthRatio = 0.15,
    this.gradient = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 255, 200, 0.3),
        Color.fromRGBO(0, 255, 200, 0),
      ],
    ),
    this.boxShadow = const [
      BoxShadow(
        color: Color(0x5164FFDA),
        blurRadius: 3,
        spreadRadius: 3,
      )
    ],
    this.backgroundBlendMode,
    this.position,
  });

  final Color color;
  final Color lineColor;
  final double lineStroke;
  final double cornerStroke;
  final double cornerLengthRatio;
  final Gradient gradient;
  final List<BoxShadow> boxShadow;
  final BlendMode? backgroundBlendMode;
  final DecorationPosition? position;
}

@immutable
class SweetButtonTheme extends BaseTheme {
  const SweetButtonTheme({
    this.height,
    this.width,
  });

  final double? width;
  final double? height;
}
