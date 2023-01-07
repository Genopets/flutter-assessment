import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/dimensions.dart';
import 'package:flutter_inventory/app/styles/gradients.dart';
import 'package:flutter_inventory/app/styles/widgets_theme.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeDataT {
  const ThemeDataT({
    required this.colors,
    required this.sizes,
    required this.widgets,
    required this.spacing,
    required this.radius,
    required this.radii,
    required this.linearGradients,
  });

  factory ThemeDataT.fallback() {
    return ThemeDataT(
      colors: appColors,
      sizes: Sizes(),
      spacing: Spacing(),
      widgets: const WidgetsThemeData(),
      radius: themeRadius,
      radii: rawRadius,
      linearGradients: GenopetsLinearGradient(),
    );
  }

  final GenopetsColors colors;
  final GenopetsLinearGradient linearGradients;
  final Sizes sizes;
  final Spacing spacing;
  final WidgetsThemeData widgets;
  final Radii<Radius> radius;
  final Radii<double> radii;

  LinearGradient backgroundGradient(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.background.teal;
      case ColorPresets.purple:
        return colors.background.purple;
      case ColorPresets.blue:
        return colors.background.blue;
      case ColorPresets.yellow:
        return colors.background.yellow;
      case ColorPresets.orange:
        return colors.background.orange;
      case ColorPresets.pink:
        return colors.background.pink;
      case ColorPresets.grey:
        return colors.background.grey;
      default:
        return colors.background.teal;
    }
  }

  /// Get primary color from presets
  Color primaryColor(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.primary.teal;
      case ColorPresets.purple:
        return colors.primary.purple;
      case ColorPresets.blue:
        return colors.primary.blue;
      case ColorPresets.yellow:
        return colors.primary.yellow;
      case ColorPresets.orange:
        return colors.primary.orange;
      case ColorPresets.pink:
        return colors.primary.pink;
      case ColorPresets.grey:
        return colors.primary.grey;
      case ColorPresets.black:
        return colors.primary.black;
      case ColorPresets.white:
        return colors.primary.white;
      default:
        return colors.primary.teal;
    }
  }

  Color textColor(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.text.teal;
      case ColorPresets.purple:
        return colors.text.purple;
      case ColorPresets.blue:
        return colors.text.blue;
      case ColorPresets.yellow:
        return colors.text.yellow;
      case ColorPresets.orange:
        return colors.text.orange;
      case ColorPresets.pink:
        return colors.text.pink;
      case ColorPresets.grey:
        return colors.text.grey;
      case ColorPresets.black:
        return colors.text.black;
      case ColorPresets.white:
        return colors.text.white;
      default:
        return colors.text.teal;
    }
  }

  Color opacityColor(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.opacities.teal;
      case ColorPresets.purple:
        return colors.opacities.purple;
      case ColorPresets.blue:
        return colors.opacities.blue;
      case ColorPresets.yellow:
        return colors.opacities.yellow;
      case ColorPresets.orange:
        return colors.opacities.orange;
      case ColorPresets.pink:
        return colors.opacities.pink;
      case ColorPresets.grey:
        return colors.opacities.grey;
      case ColorPresets.black:
        return colors.opacities.black;
      case ColorPresets.white:
        return colors.opacities.white;
      default:
        return colors.opacities.teal;
    }
  }

  LinearGradient gradient(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.gradients.teal;
      case ColorPresets.purple:
        return colors.gradients.purple;
      case ColorPresets.blue:
        return colors.gradients.blue;
      case ColorPresets.yellow:
        return colors.gradients.yellow;
      case ColorPresets.orange:
        return colors.gradients.orange;
      case ColorPresets.pink:
        return colors.gradients.pink;
      case ColorPresets.grey:
        return colors.gradients.grey;
      case ColorPresets.white:
        return colors.gradients.white;
      case ColorPresets.black:
        return colors.gradients.black;
      default:
        return colors.gradients.teal;
    }
  }

  LinearGradient multiColorGradient(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return LinearGradient(
            colors: [HexColor('#00FFC8'), HexColor('#FFC000')]);
      case ColorPresets.purple:
        return colors.gradients.purple;
      case ColorPresets.blue:
        return colors.gradients.blue;
      case ColorPresets.yellow:
        return LinearGradient(
            colors: [HexColor('#FF7A00'), HexColor('#FFC000')]);
      case ColorPresets.orange:
        return colors.gradients.orange;
      case ColorPresets.pink:
        return LinearGradient(
            colors: [HexColor('#FF0063'), HexColor('#FF7A00')]);
      case ColorPresets.grey:
        return colors.gradients.grey;
      case ColorPresets.white:
        return colors.gradients.white;
      case ColorPresets.black:
        return colors.gradients.black;
      default:
        return colors.gradients.teal;
    }
  }

  GradientTypes modalGradients(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return GradientTypes.withColor(color: '#0C1F22');
      case ColorPresets.purple:
        return GradientTypes.withColor(color: '#b700ff');
      case ColorPresets.blue:
        return GradientTypes.withColor(color: '#00a6ff');
      case ColorPresets.yellow:
        return GradientTypes.withColor(color: '#22200C');
      case ColorPresets.orange:
        return GradientTypes.withColor(color: '#ff7a00');
      case ColorPresets.pink:
        return GradientTypes.withColor(color: '#3C1524');
      case ColorPresets.grey:
        return GradientTypes.withColor(color: '#ff0063');
      case ColorPresets.white:
        return GradientTypes.withColor(color: '#ffffff');
      case ColorPresets.black:
        return GradientTypes.withColor(color: '#ffffff');
      default:
        return GradientTypes.withColor(color: '#0C1F22');
    }
  }

  LinearGradient overlay(ColorPresets preset) {
    switch (preset) {
      case ColorPresets.teal:
        return colors.overlays.teal;
      case ColorPresets.purple:
        return colors.overlays.purple;
      case ColorPresets.blue:
        return colors.overlays.blue;
      case ColorPresets.yellow:
        return colors.overlays.yellow;
      case ColorPresets.orange:
        return colors.overlays.orange;
      case ColorPresets.pink:
        return colors.overlays.pink;
      case ColorPresets.grey:
        return colors.overlays.grey;
      case ColorPresets.white:
        return colors.overlays.white;
      case ColorPresets.black:
        return colors.overlays.black;
      default:
        return colors.overlays.teal;
    }
  }

  LinearGradient hudGradient(ColorPresets preset) {
    final grad = GenopetsLinearGradient();
    switch (preset) {
      case ColorPresets.teal:
        return grad.hudTeal;
      case ColorPresets.blue:
        return grad.hudBlue;
      case ColorPresets.yellow:
        return grad.hudYellow;
      case ColorPresets.orange:
        return grad.hudOrange;
      case ColorPresets.pink:
        return grad.hudPink;
      case ColorPresets.purple:
        return grad.hudPurple;
      default:
        return grad.hudTeal;
    }
  }

  LinearGradient blurBgReplacement(ColorPresets preset) {
    final grad = GenopetsLinearGradient();
    switch (preset) {
      case ColorPresets.purple:
        return grad.blurBgPurple;
      case ColorPresets.teal:
        return grad.blurBgTeal;
      case ColorPresets.blue:
        return grad.blurBgBlue;
      case ColorPresets.yellow:
        return grad.blurBgYellow;
      case ColorPresets.orange:
        return grad.blurBgOrange;
      case ColorPresets.pink:
        return grad.blurBgPink;
      default:
        return grad.blurBgTeal;
    }
  }
}

final ThemeDataT genopetDarkTheme = ThemeDataT(
  colors: appColors,
  sizes: Sizes(),
  spacing: Spacing(),
  widgets: const WidgetsThemeData(),
  radius: themeRadius,
  radii: rawRadius,
  linearGradients: GenopetsLinearGradient(),
);

/// Just like [Theme], applies a theme to descendant vizor widgets.
///
/// Descendant widgets obtain the current theme's [GenopetsTheme] object using
/// [GenopetsTheme.of]. When a widget uses [GenopetsTheme.of], it is automatically
/// rebuilt if the theme later changes, so that the changes can be applied.
class GenopetsTheme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const GenopetsTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final ThemeDataT data;

  /// The widget below this widget in the tree.
  final Widget child;

  static final ThemeDataT _kFallbackTheme = ThemeDataT.fallback();

  /// The data from the closest [GenopetsTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [ThemeDataT.fallback] if there is no [ThemeDataT] in the given
  /// build context.
  static ThemeDataT of(BuildContext context) {
    final inheritedGenopetsTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedGenopetsTheme>();

    return inheritedGenopetsTheme?.theme.data ?? _kFallbackTheme;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedGenopetsTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedGenopetsTheme extends InheritedTheme {
  const _InheritedGenopetsTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final GenopetsTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorGenopetsTheme =
        context.findAncestorWidgetOfExactType<_InheritedGenopetsTheme>();
    return identical(this, ancestorGenopetsTheme)
        ? child
        : GenopetsTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedGenopetsTheme old) =>
      theme.data != old.theme.data;
}

@immutable
class WidgetsThemeData {
  const WidgetsThemeData({
    this.animationCurve = Curves.fastOutSlowIn,
    this.animationDuration = const Duration(milliseconds: 800),
    this.frameTheme = const TypewriterFrameTheme(),
    this.buttonTheme = const SweetButtonTheme(),
  });

  factory WidgetsThemeData.fallback() {
    return const WidgetsThemeData();
  }

  final Curve animationCurve;
  final Duration animationDuration;
  final TypewriterFrameTheme frameTheme;
  final SweetButtonTheme buttonTheme;
}

class GradientTypes {
  GradientTypes.withColor({required String color}) {
    bottom25 = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.9),
        ]);
    bottom30 = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
        ]);
    bottom50 = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
        ]);

    bottom75 = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
        ]);

    bottom90 = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor(color).withOpacity(0.2),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
          HexColor(color).withOpacity(0.9),
        ]);
    standard = LinearGradient(
        transform: const GradientRotation(2.96077654),
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          HexColor('#08160C').withOpacity(0.2),
          HexColor('#08160C').withOpacity(0.9),
        ]);

    pink100 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.decal,
      colors: [
        HexColor('#271119'),
        HexColor('#71002B').withOpacity(0.7),
        HexColor('#71002B').withOpacity(0.7),
        HexColor('#71002B'),
      ],
    );

    overlay25 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.decal,
      colors: [
        HexColor(color).withOpacity(0),
        HexColor(color).withOpacity(0),
        HexColor(color).withOpacity(0),
        HexColor(color),
      ],
    );
  }

  late LinearGradient bottom25;
  late LinearGradient bottom30;
  late LinearGradient bottom50;
  late LinearGradient bottom75;
  late LinearGradient bottom90;
  late LinearGradient standard;
  late LinearGradient pink100;
  late LinearGradient overlay25;
}
