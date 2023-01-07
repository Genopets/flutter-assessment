import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

/// [QuantityCounter] Widget is a widget for counters
class QuantityCounter extends StatefulWidget {
  const QuantityCounter({
    Key? key,
    this.initialCount = 0,
    this.onChange,
    this.height = 85,
    this.color,
    this.backgroundGradient,
    this.child,
    this.maxCount = 1000,
    this.minCount = 0,
    this.preset = ColorPresets.yellow,
  }) : super(key: key);

  final int initialCount;
  final int maxCount;
  final int minCount;
  final Widget? child;
  final double height;
  final Color? color;
  final LinearGradient? backgroundGradient;
  final void Function(int count)? onChange;
  final ColorPresets preset;

  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _count = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    setState(() {
      _count = widget.initialCount;
    });
  }

  void _onPress(bool dec) {
    setState(() {
      if (_count > widget.minCount && dec) {
        _count--;
      } else if (!dec && _count < widget.maxCount) {
        _count++;
      }
    });

    if (widget.onChange != null) widget.onChange!(_count);
  }

  Widget _button(
      {required String icon, required Color color, bool isLeft = false}) {
    const rad = Radius.circular(15);

    return Material(
      color: Colors.transparent,
      type: MaterialType.button,
      borderRadius: isLeft
          ? const BorderRadius.only(topLeft: rad, bottomLeft: rad)
          : const BorderRadius.only(topRight: rad, bottomRight: rad),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _onPress(isLeft),
        onHighlightChanged: (bool value) {
          if (!value) _timer.cancel();
        },
        onTapDown: (TapDownDetails details) {
          _timer = Timer.periodic(
              const Duration(milliseconds: 100), (t) => _onPress(isLeft));
        },
        onTapCancel: () => _timer.cancel(),
        onFocusChange: (bool value) {
          if (value) _timer.cancel();
        },
        child: Container(
          height: widget.height,
          width: widget.height,
          decoration: BoxDecoration(
            border: isLeft
                ? Border(right: BorderSide(color: color.withOpacity(0.5)))
                : Border(left: BorderSide(color: color.withOpacity(0.5))),
          ),
          child: Center(
            child: HeadlineLarge(
              icon,
              style: TextStyle(
                color: color.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final gradient =
        widget.backgroundGradient ?? theme.backgroundGradient(widget.preset);
    final color = widget.color ?? theme.primaryColor(widget.preset);

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 1),
            decoration: BoxDecoration(
              border: Border.all(
                color: color.withOpacity(0.5),
              ),
              gradient: gradient,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            height: widget.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                _button(icon: '-', isLeft: true, color: color),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 25,
                          child: widget.child ??
                              SvgPicture.asset(
                                Assets.images.diamond,
                                allowDrawingOutsideViewBox: true,
                                color: color,
                              ),
                        ),
                        Subheading(
                          _count.toString(),
                          style: TextStyle(
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _button(icon: '+', color: color),
              ],
            ),
          )
        ],
      ),
    );
  }
}
