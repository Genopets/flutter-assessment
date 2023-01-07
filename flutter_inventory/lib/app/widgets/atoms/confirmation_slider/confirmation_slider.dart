import 'package:flutter/material.dart';

class ConfirmationSlider extends StatefulWidget {
  const ConfirmationSlider({
    Key? key,
    this.height = 70,
    this.width = 300,
    this.backgroundColor = Colors.white,
    this.backgroundColorEnd,
    this.foregroundColor = Colors.transparent,
    this.iconColor = Colors.white,
    this.shadow,
    this.sliderButtonContent = const Icon(
      Icons.chevron_right,
      color: Colors.white,
      size: 35,
    ),
    this.textWidget = const Text(
      'Slide to confirm',
      style: TextStyle(
        color: Colors.black26,
      ),
    ),
    required this.onConfirmation,
    this.onTapDown,
    this.onTapUp,
    this.foregroundShape,
    this.backgroundShape,
    this.stickToEnd = false,
  })  : assert(height >= 25 && width >= 250),
        super(key: key);

  /// Height of the slider. Defaults to 70.
  final double height;

  /// Width of the slider. Defaults to 300.
  final double width;

  /// The color of the background of the slider. Defaults to Colors.white.
  final Color backgroundColor;

  /// The color of the background of the slider when it has been slide to the end. By giving a value here, the background color
  /// will gradually change from backgroundColor to backgroundColorEnd when the user slides. Is not used by default.
  final Color? backgroundColorEnd;

  /// The color of the moving element of the slider. Defaults to Colors.blueAccent.
  final Color foregroundColor;

  /// The color of the icon on the moving element if icon is IconData. Defaults to Colors.white.
  final Color iconColor;

  /// The sweet_button widget used on the moving element of the slider. Defaults to Icon(Icons.chevron_right).
  final Widget sliderButtonContent;

  /// The shadow below the slider. Defaults to BoxShadow(color: Colors.black38, offset: Offset(0, 2),blurRadius: 2,spreadRadius: 0,).
  final BoxShadow? shadow;

  /// The text showed below the foreground. Used to specify the functionality to the user. Defaults to "Slide to confirm".
  final Widget textWidget;

  /// The callback when slider is completed. This is the only required field.
  final VoidCallback onConfirmation;

  /// The callback when slider is pressed.
  final VoidCallback? onTapDown;

  /// The callback when slider is release.
  final VoidCallback? onTapUp;

  /// The shape of the moving element of the slider. Defaults to a circular border radius
  final BorderRadius? foregroundShape;

  /// The shape of the background of the slider. Defaults to a circular border radius
  final BorderRadius? backgroundShape;

  /// Stick the slider to the end
  final bool stickToEnd;

  @override
  State<StatefulWidget> createState() {
    return ConfirmationSliderState();
  }
}

class ConfirmationSliderState extends State<ConfirmationSlider> {
  double _position = 0;
  int _duration = 0;

  double _getPosition() {
    if (_position < 0) {
      return 0;
    } else if (_position > widget.width - widget.height) {
      return widget.width - widget.height;
    } else {
      return _position;
    }
  }

  void _updatePosition(dynamic details) {
    if (details is DragEndDetails) {
      setState(() {
        _duration = 600;
        if (widget.stickToEnd && _position > widget.width - widget.height) {
          _position = widget.width - widget.height;
        } else {
          _position = 0;
        }
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _duration = 0;
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  void _sliderReleased(dynamic details) {
    if (_position > widget.width - widget.height) {
      widget.onConfirmation();
    }
    _updatePosition(details);
  }

  Color _calculateBackground() {
    if (widget.backgroundColorEnd != null) {
      double percent;

      // calculates the percentage of the position of the slider
      if (_position > widget.width - widget.height) {
        percent = 1.0;
      } else if (_position / (widget.width - widget.height) > 0) {
        percent = _position / (widget.width - widget.height);
      } else {
        percent = 0.0;
      }

      final red = widget.backgroundColorEnd!.red;
      final green = widget.backgroundColorEnd!.green;
      final blue = widget.backgroundColorEnd!.blue;

      return Color.alphaBlend(
          Color.fromRGBO(red, green, blue, percent), widget.backgroundColor);
    } else {
      return widget.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color animColor;
    if (widget.backgroundColorEnd != null) {
      animColor = _calculateBackground();
    } else {
      animColor = widget.backgroundColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: _duration),
      curve: Curves.ease,
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: widget.backgroundShape ??
            BorderRadius.all(
              Radius.circular(widget.height),
            ),
        border: Border.all(
          color: animColor.withOpacity(0.02),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            animColor.withOpacity(0.5),
            Colors.transparent,
            Colors.transparent,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Center(
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: 1, //_position / widget.width,
                duration: const Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: widget.textWidget,
              ),
            ),
          ),
          Positioned(
            left: widget.height / 2,
            child: AnimatedContainer(
              height: widget.height - 10,
              width: _getPosition(),
              duration: Duration(milliseconds: _duration),
              curve: Curves.ease,
              decoration: BoxDecoration(
                borderRadius: widget.backgroundShape ??
                    BorderRadius.all(
                      Radius.circular(widget.height),
                    ),
                color: Colors.transparent,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: _duration),
            curve: Curves.bounceOut,
            left: _getPosition(),
            top: 0,
            child: GestureDetector(
              onTapDown: (_) =>
                  widget.onTapDown != null ? widget.onTapDown!() : null,
              onTapUp: (_) => widget.onTapUp != null ? widget.onTapUp!() : null,
              onPanUpdate: _updatePosition,
              onPanEnd: (details) {
                if (widget.onTapUp != null) widget.onTapUp!();
                _sliderReleased(details);
              },
              child: Container(
                height: widget.height - 10,
                decoration: BoxDecoration(
                  borderRadius: widget.foregroundShape ??
                      BorderRadius.all(Radius.circular(widget.height / 2)),
                  color: Colors.transparent,
                ),
                child: widget.sliderButtonContent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
