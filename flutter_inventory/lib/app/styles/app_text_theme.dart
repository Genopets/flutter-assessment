import 'package:flutter/material.dart';
import 'package:flutter_inventory/gen/fonts.gen.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textThemePpMonument;

  static TextTheme textThemePpMonument = const TextTheme(
    headline1: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 20,
      height: 1.7,
      letterSpacing: 1.2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    headline2: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 24,
      letterSpacing: 2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    headline3: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 20,
      letterSpacing: 2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    headline4: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 18,
      letterSpacing: 2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    headline5: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 16,
      letterSpacing: 2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    headline6: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 14,
      letterSpacing: 1,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    subtitle1: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 20,
      color: Color.fromRGBO(189, 255, 241, 1),
      height: 1,
    ),
    subtitle2: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 14,
      letterSpacing: 2,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    bodyText1: TextStyle(
        fontFamily: FontFamily.balooThambi2,
        fontSize: 16,
        color: Color.fromRGBO(189, 255, 241, 1),
        letterSpacing: 0),
    bodyText2: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 14,
      color: Color.fromRGBO(189, 255, 241, 1),
      height: 1,
    ),
    button: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 14,
      letterSpacing: 1.25,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    caption: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 10,
      letterSpacing: 1,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
    overline: TextStyle(
      fontFamily: FontFamily.pPMonument,
      fontSize: 8,
      letterSpacing: 1.5,
      color: Color.fromRGBO(189, 255, 241, 1),
    ),
  );
}
