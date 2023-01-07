import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/gen/fonts.gen.dart';

class ScrambledText extends StatefulWidget {
  const ScrambledText(
    this.data, {
    Key? key,
    this.secondFontSize = 32.0,
    this.controller,
    this.autoStartAnimation = true,
    this.opacityDuration = const Duration(seconds: 1),
    this.animationDuration = const Duration(milliseconds: 300),
    this.style,
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
    this.showText = false,
    this.onAnimationComplete,
    this.onAnimationStart,
    this.iteration = 15,
    this.gap = 5,
    required this.width,
    this.shouldPlaySound = false,
    this.isControllerAnimationCompleted = false,
  }) : super(key: key);

  final String data;
  final double secondFontSize;
  final ScrambledTextController? controller;
  final TextStyle? style;
  final bool autoStartAnimation;
  final Duration opacityDuration;
  final Duration animationDuration;
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
  final bool showText;
  final VoidCallback? onAnimationComplete;
  final VoidCallback? onAnimationStart;
  final int? iteration;
  final int? gap;
  final double width;
  final bool shouldPlaySound;
  final bool isControllerAnimationCompleted;

  @override
  _ScrambledTextState createState() => _ScrambledTextState();
}

class _ScrambledTextState extends State<ScrambledText>
    with TickerProviderStateMixin {
  late List<int> _hideList;
  late TextStyle _style;

  final _fontChangeList = <int>[];
  final _random = Random();
  final List<AnimationController> _slideAnimationControllers = [];
  final List<Animation<double>> _tweenAnimations = [];
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  var _counter = 0;
  var _isTextVisible = false;
  var _isSlideTransitionInitiated = false;

  Timer? _animationTimer;
  List<String> _characters = <String>[];

  bool stopSound = false;

  @override
  void initState() {
    super.initState();
    _initializeST();
  }

  @override
  Widget build(BuildContext context) => _isTextVisible
      ? Wrap(
          alignment: _getWrapAlignment(),
          runSpacing: _style.letterSpacing ?? 0,
          children: _wordWidgets(),
        )
      : const SizedBox.shrink();

  void _initializeST() {
    _style = widget.style ?? const TextStyle(fontFamily: FontFamily.pPMonument);

    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (mounted) {
          switch (widget.controller!.actions) {
            case ScrambledTextActions.animate:
              _animateText();
              break;
            case ScrambledTextActions.hideText:
              _hideText();
              break;
            case ScrambledTextActions.showText:
              _showText();
              break;
            default:
              return;
          }
        }
      });
    }
    _initializeSlideAnimations();
    if (widget.autoStartAnimation && mounted) {
      _animateText();
    } else if (widget.showText) {
      _showText();
    }
    _hideList = [];
    if (!widget.showText) {
      _hideList =
          List.generate(widget.data.characters.length, (index) => index);
      _characters = List.generate(widget.data.characters.length, (index) => '');
    } else {
      _characters = widget.data.characters.toList();
    }
  }

  void _initializeSlideAnimations() {
    for (var i = 0; i < widget.data.characters.toList().length; i++) {
      final controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 500 + (i * 60)));
      final positionAnimation = Tween<double>(begin: 50, end: 0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut))
        ..addListener(() => setState(() {}));
      _slideAnimationControllers.add(controller);
      _tweenAnimations.add(positionAnimation);
    }
  }

  WrapAlignment _getWrapAlignment() {
    switch (widget.textAlign) {
      case TextAlign.left:
      case TextAlign.start:
        return WrapAlignment.start;
      case TextAlign.right:
        return WrapAlignment.end;
      default:
        return WrapAlignment.center;
    }
  }

  Widget _makeWord(List<Widget> children) {
    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _makeCharacter(int index, bool isHidden, bool useGalacticFont) {
    return IntrinsicWidth(
      child: AnimatedOpacity(
        duration: widget.opacityDuration,
        opacity: isHidden ? 0 : 1,
        curve: Curves.easeOut,
        child: Center(
          child: Transform.translate(
            offset: Offset(
                widget.isControllerAnimationCompleted
                    ? 0
                    : _tweenAnimations[index].value,
                0),
            child: _styledText(_characters[index], useGalacticFont),
          ),
        ),
      ),
    );
  }

  Widget _styledText(String text, bool useGalacticoFont) {
    return Text(
      text,
      softWrap: widget.softWrap,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      overflow: widget.overflow,
      key: widget.key,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
      textScaleFactor: widget.textScaleFactor,
      style: _style.merge(
        TextStyle(
          fontSize: _style.fontSize,
          fontFamily:
              useGalacticoFont ? FontFamily.galacticoBasic : _style.fontFamily,
        ),
      ),
    );
  }

  List<Widget> _wordWidgets() {
    final _wordWidgetList = <Widget>[];
    final _characterWidgetList = <Widget>[];

    for (var i = 0; i < _characters.length; i++) {
      final _isHidden = _hideList.contains(i);
      final useGalacticFont = _fontChangeList.contains(i);
      if (i == (_characters.length - 1)) {
        _characterWidgetList.add(_makeCharacter(i, _isHidden, useGalacticFont));
        _wordWidgetList.add(_makeWord(_characterWidgetList.toList()));
        _characterWidgetList.clear();
      } else if (widget.data.characters.toList()[i] == ' ') {
        _wordWidgetList.add(_makeWord(_characterWidgetList.toList()));
        _characterWidgetList.clear();
        _wordWidgetList.add(_makeCharacter(i, _isHidden, useGalacticFont));
      } else {
        _characterWidgetList.add(_makeCharacter(i, _isHidden, useGalacticFont));
      }
    }
    return _wordWidgetList;
  }

  void _animateText() {
    _showText();
    _counter = 0;
    _fontChangeList.clear();
    for (var i = 0; i < widget.data.characters.length; i++) {
      if (widget.data.characters.toList()[i] != ' ') {
        _fontChangeList.add(i);
      }
    }
    if (!_isSlideTransitionInitiated) {
      for (final controller in _slideAnimationControllers) {
        final _ = controller.forward();
      }
      _isSlideTransitionInitiated = true;
    }
    _onAnimationStart();
    final totalIteration =
        widget.iteration! + ((widget.data.characters.length - 1) * widget.gap!);
    final timerDuration = Duration(
        microseconds:
            (widget.animationDuration.inMicroseconds / totalIteration).round());
    _animationTimer = Timer.periodic(timerDuration, (timer) {
      if (_counter <= totalIteration) {
        if (!mounted) return;
        setState(() {
          final revealIndexCounter = _counter >= widget.iteration!
              ? _counter - widget.iteration!
              : _counter;
          final revealIndex = (revealIndexCounter / widget.gap!).floor();
          if (_counter >= widget.iteration!) {
            _fontChangeList.remove(revealIndex);

            _characters[revealIndex] =
                widget.data.characters.toList()[revealIndex].toString();
          }
          for (var i = 0; i < widget.data.characters.length; i++) {
            if (_fontChangeList.contains(i)) {
              _characters[i] = _chars[_random.nextInt(_chars.length)];
            }
          }
          _hideList.clear();
          _counter++;
        });
      } else {
        _showText();
        widget.onAnimationComplete?.call();
        timer.cancel();
        if (widget.shouldPlaySound) {
          _stopSound();
        }
      }
    });
  }

  void _onAnimationStart() {
    if (widget.shouldPlaySound) {
      _startSound();
    }
  }

  Future<void> _startSound() async {
    await _fallbackStopSound();
  }

  void _stopSound() {
    if (!stopSound) {}
    stopSound = true;
  }

  Future<void> _fallbackStopSound() async {
    await Future<void>.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
    });
  }

  void _hideText() {
    if (!mounted) return;
    setState(() {
      _isTextVisible = false;
    });
  }

  void _showText() {
    if (!mounted) return;
    setState(() {
      _isTextVisible = true;
    });
  }

  @override
  void dispose() {
    if (_animationTimer?.isActive ?? false) {
      _animationTimer?.cancel();
    }
    for (final slideAnimationController in _slideAnimationControllers) {
      slideAnimationController.dispose();
    }
    _slideAnimationControllers.clear();

    super.dispose();
  }
}

class ScrambledTextController extends ChangeNotifier {
  ScrambledTextActions? actions;
  bool _disposed = false;

  void animate() {
    if (hasListeners) {
      actions = ScrambledTextActions.animate;
      notifyListeners();
    }
  }

  void hideText() {
    if (hasListeners) {
      actions = ScrambledTextActions.hideText;
      notifyListeners();
    }
  }

  void showText() {
    if (hasListeners) {
      actions = ScrambledTextActions.showText;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}

enum ScrambledTextActions { animate, hideText, showText }
