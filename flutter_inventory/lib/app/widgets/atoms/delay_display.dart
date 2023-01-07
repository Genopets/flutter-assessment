import 'dart:async';
import 'package:flutter/material.dart';

class DelayedDisplay extends StatefulWidget {
  /// DelayedDisplay constructor
  const DelayedDisplay({
    Key? key,
    required this.child,
    this.delay = Duration.zero,
    this.onDisplay,
  }) : super(key: key);

  /// Child that will be displayed with the animation and delay
  final Widget child;

  /// Delay before displaying the widget and the animations
  final Duration delay;

  final void Function()? onDisplay;

  @override
  _DelayedDisplayState createState() => _DelayedDisplayState();
}

class _DelayedDisplayState extends State<DelayedDisplay>
    with TickerProviderStateMixin {
  /// Timer used to delayed animation
  bool _visible = false;

  /// Timer used to delayed animation
  Timer? _timer;

  /// Simple getter for widget's delay
  Duration get delay => widget.delay;

  /// Initialize controllers, curve and offset with given parameters or default values
  /// Use a Timer in order to delay the animations if needed
  @override
  void initState() {
    super.initState();
    _runFadeAnimation();
  }

  /// Dispose the opacity controller
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Whenever the widget is updated and that fadeIn is different from the oldWidget, triggers the fade in
  /// or out animation.
  @override
  void didUpdateWidget(DelayedDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runFadeAnimation();
  }

  void _runFadeAnimation() {
    _timer = Timer(delay, () {
      if (mounted) {
        setState(() {
          _visible = true;
          if (widget.onDisplay != null) {
            widget.onDisplay!();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_visible) return widget.child;
    return SizedBox.fromSize();
  }
}
