import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// [GenopetsColors] class constructs all the the variants and categories of
/// colors used in the project.
///
/// @ref in Figma
@immutable
class GenopetsColors {
  const GenopetsColors({
    required this.background,
    required this.primary,
    required this.text,
    required this.gradients,
    required this.opacities,
    required this.overlays,
  });

  /// [background] is darker no opacity background colors
  ///
  final ColorPreset<LinearGradient> background;

  /// [primary] is the default color presets.
  final ColorPreset<Color> primary;

  /// [text] is the color presets used for all text and typography
  final ColorPreset<Color> text;

  /// [gradients] is the gradient presets.
  final ColorPreset<LinearGradient> gradients;

  /// [overlays] is the gradient background overlays.
  final ColorPreset<LinearGradient> overlays;

  /// [opacities] is the primary color with opacity set to 0.2.
  final ColorPreset<Color> opacities;
}

/// Generic helper class for genopets typography presets colors
class ColorPreset<T> {
  const ColorPreset({
    required this.purple,
    required this.blue,
    required this.teal,
    required this.yellow,
    required this.orange,
    required this.grey,
    required this.pink,
    required this.white,
    required this.black,
  });

  final T teal;
  final T purple;
  final T blue;
  final T yellow;
  final T orange;
  final T pink;
  final T grey;
  final T white;
  final T black;
}

class GenopetsPrimaryColors {
  GenopetsPrimaryColors({required this.gradients, required this.single});

  final ColorPreset<LinearGradient> gradients;
  final ColorPreset<Color> single;
}

final appColors = GenopetsColors(
  background: ColorPreset<LinearGradient>(
    purple: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(173, 0, 255, 0.3),
        Color.fromRGBO(173, 0, 255, 0),
      ],
    ),
    blue: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 204, 255, 0.3),
        Color.fromRGBO(0, 204, 255, 0),
      ],
    ),
    grey: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(214, 214, 231, 0.2),
        Color.fromRGBO(214, 214, 231, 0),
      ],
    ),
    orange: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        HexColor('#392608'),
        HexColor('#181A1C'),
      ],
    ),
    pink: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 0, 99, 0.3),
        Color.fromRGBO(255, 0, 99, 0),
      ],
    ),
    white: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 255, 255, 0.2),
        Color.fromRGBO(255, 255, 255, 0),
      ],
    ),
    black: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 0, 0, 0.2),
        Color.fromRGBO(0, 0, 0, 0),
      ],
    ),
    teal: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor('#00393F'),
        HexColor('#181A1C'),
      ],
    ),
    yellow: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor('#00393F'),
        HexColor('#181A1C'),
      ],
    ),
  ),
  primary: ColorPreset<Color>(
    purple: HexColor('#B700FF'),
    blue: HexColor('#00E0FF'),
    teal: HexColor('#00FFC8'),
    yellow: HexColor('#FFC000'),
    orange: HexColor('#FF7A00'),
    pink: HexColor('#FF0063'),
    grey: HexColor('#00FFC8'),
    white: HexColor('#FFFFFF'),
    black: HexColor('#000000'),
  ),
  text: ColorPreset<Color>(
    purple: HexColor('#EDBFFF'),
    blue: HexColor('#B4E5FF'),
    teal: HexColor('#BDFFF1'),
    yellow: HexColor('#FFECB3'),
    orange: HexColor('#FFD9B6'),
    pink: HexColor('#FF96BF'),
    grey: HexColor('#00FFC8'),
    white: HexColor('#FFFFFF'),
    black: HexColor('#000000'),
  ),
  opacities: ColorPreset<Color>(
    purple: HexColor('#B700FF').withOpacity(0.2),
    blue: HexColor('#00A6FF').withOpacity(0.2),
    teal: HexColor('#00FFC8').withOpacity(0.2),
    yellow: HexColor('#FFC000').withOpacity(0.2),
    orange: HexColor('#FF7A00').withOpacity(0.2),
    pink: HexColor('#FF0063').withOpacity(0.2),
    grey: HexColor('#00FFC8').withOpacity(0.2),
    white: HexColor('#FFFFFF').withOpacity(0.2),
    black: HexColor('#000000').withOpacity(0.2),
  ),
  gradients: const ColorPreset<LinearGradient>(
    purple: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(183, 0, 255, 0.4),
        Color.fromRGBO(173, 0, 255, 0),
      ],
    ),
    blue: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 166, 255, 0.4),
        Color.fromRGBO(0, 166, 255, 0),
      ],
    ),
    teal: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 255, 200, 0.4),
        Color.fromRGBO(0, 255, 200, 0),
      ],
    ),
    yellow: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 192, 0, 0.4),
        Color.fromRGBO(255, 192, 0, 0),
      ],
    ),
    orange: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 122, 0, 0.4),
        Color.fromRGBO(255, 122, 0, 0),
      ],
    ),
    pink: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 0, 99, 0.4),
        Color.fromRGBO(255, 0, 99, 0),
      ],
    ),
    grey: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(214, 214, 231, 0.2),
        Color.fromRGBO(214, 214, 231, 0),
      ],
    ),
    white: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(255, 255, 255, 0.2),
        Color.fromRGBO(255, 255, 255, 0),
      ],
    ),
    black: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(0, 0, 0, 0.2),
        Color.fromRGBO(0, 0, 0, 0),
      ],
    ),
  ),
  overlays: ColorPreset<LinearGradient>(
    purple: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(183, 0, 255, 0.4),
        Color.fromRGBO(173, 0, 255, 0),
      ],
    ),
    blue: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor('#00393F').withOpacity(.75),
        HexColor('#181A1C').withOpacity(.75),
      ],
    ),
    teal: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#112521').withOpacity(1),
        HexColor('#00644F').withOpacity(.7),
        HexColor('#00644F').withOpacity(.7),
        HexColor('#00644F').withOpacity(.7),
        HexColor('#0D1E1A').withOpacity(1),
      ],
    ),
    yellow: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        HexColor('#1E1B0D'),
        HexColor('#756300').withOpacity(0.5),
        HexColor('#716000').withOpacity(0.5),
        HexColor('#1C190B'),
      ],
    ),
    orange: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 122, 0, 0.4),
        Color.fromRGBO(255, 122, 0, 0),
      ],
    ),
    pink: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 0, 99, 0.4),
        Color.fromRGBO(255, 0, 99, 0),
      ],
    ),
    grey: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(214, 214, 231, 0.2),
        Color.fromRGBO(214, 214, 231, 0),
      ],
    ),
    white: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 255, 255, 0.2),
        Color.fromRGBO(255, 255, 255, 0),
      ],
    ),
    black: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(0, 52, 63, 0.9),
        Color.fromRGBO(24, 26, 28, 0.9),
      ],
    ),
  ),
);

enum ColorPresets {
  teal,
  purple,
  blue,
  yellow,
  orange,
  pink,
  grey,
  white,
  black,
}
