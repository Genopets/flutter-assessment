import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/app_bar_theme_app.dart';
import 'package:flutter_inventory/app/styles/app_text_theme.dart';
import 'package:flutter_inventory/app/styles/colors.dart';

class AppThemeData {
  static bool get isDark => true;

  static ThemeData get themeData => themeDataDark;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorSchemeSeed: appColors.primary.teal,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    // fontFamily: FontFamily.pPMonument,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
  );

  static final ThemeData themeDataDark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorSchemeSeed: appColors.primary.teal,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
    canvasColor: Colors.black,
  );
}
