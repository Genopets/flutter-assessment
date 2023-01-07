import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typewriter/scrambled_text.dart';
import 'package:flutter_inventory/gen/fonts.gen.dart';

class BaseText extends StatelessWidget {
  const BaseText(
    this.data, {
    Key? key,
    required this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.resizable = false,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.wrapWords = true,
    this.group,
    this.overflowReplacement,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.autoStartAnimation = true,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.showText = false,
    this.onAnimationComplete,
    this.width,
    @required this.animationDuration,
    this.iteration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
  }) : super(key: key);

  final TextStyle style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool resizable;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final VoidCallback? onAnimationComplete;
  final double? width;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;
  final int? iteration;
  final int? gap;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  ///displays text by default when scrambled text is enabled
  final bool showText;

  @override
  Widget build(BuildContext context) {
    if (enableScrambledText) {
      return enableShadowText
          ? Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ScrambledText(
                    data,
                    style: bgStyle,
                    softWrap: softWrap,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textDirection: textDirection,
                    locale: locale,
                    overflow: overflow,
                    key: UniqueKey(),
                    maxLines: maxLines,
                    semanticsLabel: semanticsLabel,
                    textWidthBasis: textWidthBasis,
                    textHeightBehavior: textHeightBehavior,
                    textScaleFactor: textScaleFactor,
                    controller: bgScrambledTextController,
                    autoStartAnimation: autoStartAnimation,
                    showText: showText,
                    onAnimationComplete: onAnimationComplete,
                    width: width ?? MediaQuery.of(context).size.width,
                    iteration: iteration ?? 15,
                    gap: gap ?? 5,
                    animationDuration:
                        animationDuration ?? const Duration(milliseconds: 300),
                    shouldPlaySound: shouldPlaySound,
                    isControllerAnimationCompleted:
                        isAnimationControllerCompleted,
                  ),
                  ScrambledText(
                    data,
                    style: style,
                    softWrap: softWrap,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textDirection: textDirection,
                    locale: locale,
                    overflow: overflow,
                    key: UniqueKey(),
                    maxLines: maxLines,
                    semanticsLabel: semanticsLabel,
                    textWidthBasis: textWidthBasis,
                    textHeightBehavior: textHeightBehavior,
                    textScaleFactor: textScaleFactor,
                    controller: scrambledTextController,
                    autoStartAnimation: autoStartAnimation,
                    showText: showText,
                    onAnimationComplete: onAnimationComplete,
                    width: width ?? MediaQuery.of(context).size.width,
                    iteration: iteration ?? 15,
                    gap: gap ?? 5,
                    animationDuration:
                        animationDuration ?? const Duration(milliseconds: 300),
                    shouldPlaySound: shouldPlaySound,
                    isControllerAnimationCompleted:
                        isAnimationControllerCompleted,
                  )
                ],
              ),
            )
          : LayoutBuilder(
              builder: (context, constraint) => ScrambledText(
                data,
                key: UniqueKey(),
                style: style,
                controller: scrambledTextController,
                autoStartAnimation: autoStartAnimation,
                textAlign: textAlign,
                showText: showText,
                onAnimationComplete: onAnimationComplete,
                width: 335,
                iteration: iteration ?? 15,
                gap: gap ?? 5,
                animationDuration:
                    animationDuration ?? const Duration(milliseconds: 300),
                shouldPlaySound: shouldPlaySound,
                isControllerAnimationCompleted: isAnimationControllerCompleted,
              ),
            );
    }

    if (resizable) {
      return enableShadowText
          ? Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AutoSizeText(
                    data,
                    style: bgStyle,
                    softWrap: softWrap,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textDirection: textDirection,
                    locale: locale,
                    overflow: overflow,
                    key: key,
                    maxLines: maxLines,
                    semanticsLabel: semanticsLabel,
                    wrapWords: wrapWords,
                    group: group,
                    textScaleFactor: textScaleFactor,
                    presetFontSizes: presetFontSizes,
                    overflowReplacement: overflowReplacement,
                    maxFontSize: maxFontSize,
                    minFontSize: minFontSize,
                    stepGranularity: stepGranularity,
                  ),
                  AutoSizeText(
                    data,
                    style: style,
                    softWrap: softWrap,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textDirection: textDirection,
                    locale: locale,
                    overflow: overflow,
                    key: key,
                    maxLines: maxLines,
                    semanticsLabel: semanticsLabel,
                    wrapWords: wrapWords,
                    group: group,
                    textScaleFactor: textScaleFactor,
                    presetFontSizes: presetFontSizes,
                    overflowReplacement: overflowReplacement,
                    maxFontSize: maxFontSize,
                    minFontSize: minFontSize,
                    stepGranularity: stepGranularity,
                  ),
                ],
              ),
            )
          : AutoSizeText(
              data,
              style: style,
              softWrap: softWrap,
              strutStyle: strutStyle,
              textAlign: textAlign,
              textDirection: textDirection,
              locale: locale,
              overflow: overflow,
              key: key,
              maxLines: maxLines,
              semanticsLabel: semanticsLabel,
              wrapWords: wrapWords,
              group: group,
              textScaleFactor: textScaleFactor,
              presetFontSizes: presetFontSizes,
              overflowReplacement: overflowReplacement,
              maxFontSize: maxFontSize,
              minFontSize: minFontSize,
              stepGranularity: stepGranularity,
            );
    }

    return !enableShadowText
        ? Text(
            data,
            style: style,
            softWrap: softWrap,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            overflow: overflow,
            key: key,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            textScaleFactor: textScaleFactor,
          )
        : Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  data,
                  style: bgStyle,
                  softWrap: softWrap,
                  strutStyle: strutStyle,
                  textAlign: textAlign,
                  textDirection: textDirection,
                  locale: locale,
                  overflow: overflow,
                  key: key,
                  maxLines: maxLines,
                  semanticsLabel: semanticsLabel,
                  textWidthBasis: textWidthBasis,
                  textHeightBehavior: textHeightBehavior,
                  textScaleFactor: textScaleFactor,
                ),
                Text(
                  data,
                  style: style,
                  softWrap: softWrap,
                  strutStyle: strutStyle,
                  textAlign: textAlign,
                  textDirection: textDirection,
                  locale: locale,
                  overflow: overflow,
                  key: key,
                  maxLines: maxLines,
                  semanticsLabel: semanticsLabel,
                  textWidthBasis: textWidthBasis,
                  textHeightBehavior: textHeightBehavior,
                  textScaleFactor: textScaleFactor,
                ),
              ],
            ),
          );
  }
}

class TitleXXL extends StatelessWidget {
  const TitleXXL(this.data,
      {Key? key,
      this.style,
      this.bgStyle,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior,
      this.enableScrambledText = false,
      this.enableShadowText = false,
      this.resizable = false,
      this.scrambledTextController,
      this.bgScrambledTextController,
      this.minFontSize = 12,
      this.maxFontSize = double.infinity,
      this.stepGranularity = 1,
      this.wrapWords = true,
      this.autoStartAnimation = true,
      this.presetFontSizes,
      this.group,
      this.overflowReplacement,
      this.showText = false,
      this.onAnimationComplete,
      this.iteration,
      this.animationDuration,
      this.gap,
      this.shouldPlaySound = false,
      this.isAnimationControllerCompleted = false,
      this.textColor,
      this.isLowercase})
      : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final Color? textColor;
  final bool? isLowercase;

  final bool showText;
  final VoidCallback? onAnimationComplete;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    return Stack(
      children: [
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1!.copyWith(fontSize: 40).merge(style).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = textColor != null
                      ? textColor!.withOpacity(0.2)
                      : appColors.primary.teal.withOpacity(0.2),
              ),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1.copyWith(fontSize: 40).merge(style).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = textColor ?? appColors.primary.teal,
              ),
          // bgStyle: headline1Shadow?.merge(bgStyle),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
      ],
    );
  }
}

class TitleXL extends StatelessWidget {
  const TitleXL(this.data,
      {Key? key,
      this.style,
      this.bgStyle,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior,
      this.enableScrambledText = false,
      this.enableShadowText = false,
      this.resizable = false,
      this.scrambledTextController,
      this.bgScrambledTextController,
      this.minFontSize = 12,
      this.maxFontSize = double.infinity,
      this.stepGranularity = 1,
      this.wrapWords = true,
      this.autoStartAnimation = true,
      this.presetFontSizes,
      this.group,
      this.overflowReplacement,
      this.showText = false,
      this.onAnimationComplete,
      this.iteration,
      this.animationDuration,
      this.gap,
      this.shouldPlaySound = false,
      this.isAnimationControllerCompleted = false,
      this.textColor,
      this.isLowercase})
      : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final Color? textColor;
  final bool? isLowercase;

  final bool showText;
  final VoidCallback? onAnimationComplete;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    return Stack(
      children: [
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1!.merge(style).copyWith(
                fontSize: 32,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = textColor != null
                      ? textColor!.withOpacity(0.2)
                      : appColors.primary.teal.withOpacity(0.2),
              ),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1.merge(style).copyWith(
                fontSize: 32,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = textColor ?? appColors.primary.teal,
              ),
          // bgStyle: headline1Shadow?.merge(bgStyle),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
      ],
    );
  }
}

/// 20px - PP Monument Extended - Border
class TitleLarge extends StatelessWidget {
  const TitleLarge(this.data,
      {Key? key,
      this.style,
      this.bgStyle,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior,
      this.enableScrambledText = false,
      this.enableShadowText = false,
      this.resizable = false,
      this.scrambledTextController,
      this.bgScrambledTextController,
      this.minFontSize = 12,
      this.maxFontSize = double.infinity,
      this.stepGranularity = 1,
      this.wrapWords = true,
      this.autoStartAnimation = true,
      this.presetFontSizes,
      this.group,
      this.overflowReplacement,
      this.showText = false,
      this.onAnimationComplete,
      this.iteration,
      this.animationDuration,
      this.gap,
      this.shouldPlaySound = false,
      this.isAnimationControllerCompleted = false,
      this.textColor,
      this.isLowercase})
      : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final Color? textColor;
  final bool? isLowercase;

  final bool showText;
  final VoidCallback? onAnimationComplete;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    return Stack(
      children: [
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1!.merge(style).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = textColor != null
                      ? textColor!.withOpacity(0.2)
                      : appColors.primary.teal.withOpacity(0.2),
              ),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
        BaseText(
          isLowercase == true ? data : data.toUpperCase(),
          style: headline1.merge(style).copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = textColor ?? appColors.primary.teal,
              ),
          // bgStyle: headline1Shadow?.merge(bgStyle),
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          overflow: overflow,
          key: key,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          resizable: resizable,
          stepGranularity: stepGranularity,
          maxFontSize: maxFontSize,
          textScaleFactor: textScaleFactor,
          wrapWords: wrapWords,
          enableScrambledText: enableScrambledText,
          // enableShadowText: enableShadowText,
          group: group,
          minFontSize: minFontSize,
          overflowReplacement: overflowReplacement,
          presetFontSizes: presetFontSizes,
          bgScrambledTextController: bgScrambledTextController,
          scrambledTextController: scrambledTextController,
          autoStartAnimation: autoStartAnimation,
          showText: showText,
          onAnimationComplete: onAnimationComplete,
          iteration: iteration,
          gap: gap,
          animationDuration: animationDuration,
          shouldPlaySound: shouldPlaySound,
          isAnimationControllerCompleted: isAnimationControllerCompleted,
        ),
      ],
    );
  }
}

/// 20px - PP Monument Extended -
class HeadlineLarge extends StatelessWidget {
  const HeadlineLarge(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.resizable = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.wrapWords = true,
    this.autoStartAnimation = true,
    this.presetFontSizes,
    this.group,
    this.overflowReplacement,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
    this.isLowercase,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool? isLowercase;

  final bool showText;
  final VoidCallback? onAnimationComplete;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline3;
    final headlineShadow = Theme.of(context).textTheme.headline3?.merge(
          const TextStyle(
            fontFamily: FontFamily.mokotoGlitchOutline,
            fontSize: 21,
            letterSpacing: 1.3,
          ),
        );

    return BaseText(
      isLowercase == true ? data : data.toUpperCase(),
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

/// 10px - PP Monument Extended - Uppercase
class HeadlineSmall extends StatelessWidget {
  const HeadlineSmall(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.resizable = false,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.minFontSize = 16,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.wrapWords = true,
    this.group,
    this.overflowReplacement,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.autoStartAnimation = true,
    this.shouldPlaySound = false,
    this.isLowercase = false,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool resizable;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool isLowercase;

  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool autoStartAnimation;

  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool shouldPlaySound;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context)
        .textTheme
        .caption
        ?.merge(const TextStyle(letterSpacing: 2));
    final headlineShadow = Theme.of(context).textTheme.caption?.merge(TextStyle(
        fontFamily: FontFamily.mokotoGlitch,
        color: GenopetsTheme.of(context).colors.text.teal,
        letterSpacing: -3));

    return BaseText(
      data.toUpperCase(),
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
    );
  }
}

/// 14px - PP Monument Extended - Lowercase
class Subheading extends StatelessWidget {
  const Subheading(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.resizable = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.wrapWords = true,
    this.autoStartAnimation = true,
    this.presetFontSizes,
    this.group,
    this.overflowReplacement,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
    this.isLowercase = true,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool? isLowercase;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  /// Will capit

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6;
    final headlineShadow = Theme.of(context).textTheme.headline6?.merge(
          const TextStyle(
              fontFamily: FontFamily.mokotoGlitchOutline,
              fontSize: 14,
              height: 1.5),
        );

    return BaseText(
      data.toUpperCase(),
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

/// 16px - Baloo Thambi 2 - Small
class Body1 extends StatelessWidget {
  const Body1(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.resizable = false,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.minFontSize = 20,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.wrapWords = true,
    this.group,
    this.overflowReplacement,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.autoStartAnimation = true,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool resizable;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;

  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool autoStartAnimation;
  final bool isAnimationControllerCompleted;

  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool shouldPlaySound;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.bodyText1?.merge(
          TextStyle(
            color: GenopetsTheme.of(context).colors.text.teal,
          ),
        );
    final headlineShadow = Theme.of(context).textTheme.bodyText1?.merge(
        const TextStyle(
            fontFamily: FontFamily.mokotoGlitchOutline,
            fontSize: 9.5,
            letterSpacing: -1));

    return BaseText(
      data,
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

/// 10px - PP Monument Extended - Lowercase
class PlaceholderText extends StatelessWidget {
  const PlaceholderText(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.resizable = false,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.minFontSize = 16,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.wrapWords = true,
    this.group,
    this.overflowReplacement,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.autoStartAnimation = true,
    this.shouldPlaySound = false,
    this.isLowercase = false,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool resizable;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool isLowercase;

  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool autoStartAnimation;

  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool shouldPlaySound;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.caption;
    final headlineShadow = Theme.of(context).textTheme.caption?.merge(TextStyle(
        fontFamily: FontFamily.mokotoGlitch,
        color: GenopetsTheme.of(context).colors.text.teal,
        letterSpacing: -3));

    return BaseText(
      data,
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
    );
  }
}

class LargeNumber extends StatelessWidget {
  const LargeNumber(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.resizable = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.wrapWords = true,
    this.autoStartAnimation = true,
    this.presetFontSizes,
    this.group,
    this.overflowReplacement,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
    this.isLowercase,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool? isLowercase;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context)
        .textTheme
        .headline6
        ?.merge(const TextStyle(fontSize: 600));
    final headlineShadow = Theme.of(context).textTheme.headline6?.merge(
          const TextStyle(
              fontFamily: FontFamily.mokotoGlitchOutline,
              fontSize: 620,
              letterSpacing: -0.3,
              height: 1.5),
        );

    return BaseText(
      data,
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

class MediumNumber extends StatelessWidget {
  const MediumNumber(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.resizable = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.wrapWords = true,
    this.autoStartAnimation = true,
    this.presetFontSizes,
    this.group,
    this.overflowReplacement,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
    this.isLowercase,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool? isLowercase;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context)
        .textTheme
        .headline6
        ?.merge(const TextStyle(fontSize: 180));
    final headlineShadow = Theme.of(context).textTheme.headline6?.merge(
          const TextStyle(
              fontFamily: FontFamily.mokotoGlitchOutline,
              fontSize: 200,
              letterSpacing: -0.3,
              height: 1.5),
        );

    return BaseText(
      data,
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

class SmallNumber extends StatelessWidget {
  const SmallNumber(
    this.data, {
    Key? key,
    this.style,
    this.bgStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.enableScrambledText = false,
    this.enableShadowText = false,
    this.resizable = false,
    this.scrambledTextController,
    this.bgScrambledTextController,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.wrapWords = true,
    this.autoStartAnimation = true,
    this.presetFontSizes,
    this.group,
    this.overflowReplacement,
    this.showText = false,
    this.onAnimationComplete,
    this.iteration,
    this.animationDuration,
    this.gap,
    this.shouldPlaySound = false,
    this.isAnimationControllerCompleted = false,
    this.isLowercase,
  }) : super(key: key);

  final TextStyle? style;
  final TextStyle? bgStyle;
  final String data;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool enableScrambledText;
  final bool enableShadowText;
  final bool resizable;
  final bool autoStartAnimation;
  final ScrambledTextController? scrambledTextController;
  final ScrambledTextController? bgScrambledTextController;
  final bool showText;
  final VoidCallback? onAnimationComplete;
  final bool? isLowercase;

  final int? iteration;
  final int? gap;
  final Duration? animationDuration;
  final bool shouldPlaySound;
  final bool isAnimationControllerCompleted;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// Synchronizes the size of multiple [AutoSizeText]s.
  ///
  /// If you want multiple [AutoSizeText]s to have the same text size, give all
  /// of them the same [AutoSizeGroup] instance. All of them will have the
  /// size of the smallest [AutoSizeText]
  final AutoSizeGroup? group;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context)
        .textTheme
        .headline6
        ?.merge(const TextStyle(fontSize: 60));
    final headlineShadow = Theme.of(context).textTheme.headline6?.merge(
          const TextStyle(
              fontFamily: FontFamily.mokotoGlitchOutline,
              fontSize: 80,
              letterSpacing: -0.3,
              height: 1.5),
        );

    return BaseText(
      data,
      style: headline!.merge(style),
      bgStyle: headlineShadow?.merge(bgStyle),
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      key: key,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      resizable: resizable,
      stepGranularity: stepGranularity,
      maxFontSize: maxFontSize,
      textScaleFactor: textScaleFactor,
      wrapWords: wrapWords,
      enableScrambledText: enableScrambledText,
      enableShadowText: enableShadowText,
      group: group,
      minFontSize: minFontSize,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      bgScrambledTextController: bgScrambledTextController,
      scrambledTextController: scrambledTextController,
      autoStartAnimation: autoStartAnimation,
      showText: showText,
      onAnimationComplete: onAnimationComplete,
      iteration: iteration,
      gap: gap,
      animationDuration: animationDuration,
      shouldPlaySound: shouldPlaySound,
      isAnimationControllerCompleted: isAnimationControllerCompleted,
    );
  }
}

// class HeadlineShadow4

// class HeadlineShadow3

// class HeadlineShadow5

// class HeadlineShadow6
