import 'package:flutter/cupertino.dart';

/// size dimension constants
class Sizes {
  double scale0 = 2;
  double scale100 = 4;
  double scale200 = 6;
  double scale300 = 8;
  double scale400 = 10;
  double scale450 = 11;
  double scale500 = 12;
  double scale525 = 13;
  double scale550 = 14;
  double scale575 = 15;
  double scale600 = 16;
  double scale625 = 17;
  double scale650 = 18;
  double scale700 = 20;
  double scale750 = 22;
  double scale800 = 24;
  double scale825 = 26;
  double scale850 = 28;
  double scale875 = 30;
  double scale900 = 32;
  double scale950 = 36;
  double scale1000 = 40;
  double scale1200 = 48;
  double scale1400 = 56;
  double scale1600 = 64;
  double scale1800 = 72;
  double scale2000 = 80;
  double scale2400 = 96;
  double scale3200 = 128;
  double scale4800 = 192;
}

/// spacing constants
class Spacing {
  double scale0 = 0;
  double scale1 = 4;
  double scale2 = 8;
  double scale3 = 12;
  double scale4 = 16;
  double scale5 = 20;
  double scale6 = 24;
  double scale7 = 28;
  double scale8 = 32;
  double scale9 = 36;
  double scale10 = 40;
  double scale12 = 48;
}

/// Radii type
class Radii<T> {
  Radii({
    required this.square,
    required this.pill,
    required this.rounded,
    required this.circle,
  });

  final T square;
  final T pill;
  final T rounded;
  final T circle;
}

final rawRadius = Radii<double>(
  square: 0,
  pill: 20,
  rounded: 35,
  circle: 360,
);

final themeRadius = Radii<Radius>(
  square: Radius.circular(rawRadius.square),
  pill: Radius.circular(rawRadius.pill),
  rounded: Radius.circular(rawRadius.rounded),
  circle: Radius.circular(rawRadius.circle),
);

/// Radii constants
// class Radii {
//   double square = 0;
//   double pill = 20;
//   double rounded = 35;
//   double circle = 360;
// }
