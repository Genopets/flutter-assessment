import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class DottedBorderProgressRing extends StatefulWidget {
  const DottedBorderProgressRing({
    Key? key,
    this.preset = ColorPresets.teal,
    this.size = 80,
    this.duration,
  }) : super(key: key);

  final ColorPresets preset;
  final Duration? duration;
  final double size;

  @override
  _DottedBorderProgressRingState createState() =>
      _DottedBorderProgressRingState();
}

class _DottedBorderProgressRingState extends State<DottedBorderProgressRing>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 1000),
    )..repeat();
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void deactivate() {
    _animationController.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _animationController
      ..stop()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final _color = theme.colors.primary.teal;
    final _textColor = theme.colors.text.teal;

    return RepaintBoundary(
      child: _renderCenterIcon(
        textColor: _textColor,
        color: _color,
        size: widget.size,
      ),
    );
  }

  Widget _renderCenterIcon({
    required Color textColor,
    required Color color,
    required double size,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Center(
            child: DottedBorder(
                borderType: BorderType.Circle,
                color: color.withOpacity(.2),
                child: SizedBox(
                  height: size,
                  width: size,
                )),
          ),
          Center(
            child: _renderInnerCircle(
                color: color, size: size / 1.1, noBackground: false),
          ),
          Center(
            child: RotationTransition(
              turns: _animation,
              child: _renderAnimatedCircle(
                color: color,
                size: size / 1.4,
              ),
            ),
          ),
          Center(
            child: _renderInnerCircle(
              color: color,
              size: size / 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderInnerCircle({
    required Color color,
    required double size,
    bool noBackground = true,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        gradient: noBackground
            ? null
            : LinearGradient(
                colors: [color.withOpacity(.4), Colors.transparent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
      ),
    );
  }

  Widget _renderAnimatedCircle({
    required Color color,
    required double size,
  }) {
    return CustomPaint(
      painter: _DividedBorderPainter(color: color),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(360)),
        ),
      ),
    );
  }
}

class _DividedBorderPainter extends CustomPainter {
  _DividedBorderPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);

    canvas
      ..drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        vmath.radians(-90),
        vmath.radians(90),
        false,
        paint,
      )
      ..drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        vmath.radians(-270),
        vmath.radians(90),
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
