import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class CustomRefreshProgressIndicator extends StatefulWidget {
  const CustomRefreshProgressIndicator({
    Key? key,
    this.preset = ColorPresets.teal,
    this.size = 300,
    this.duration,
    this.enableAnimation = true,
  }) : super(key: key);

  final ColorPresets preset;
  final bool enableAnimation;
  final Duration? duration;
  final double size;

  @override
  _CustomRefreshProgressIndicatorState createState() =>
      _CustomRefreshProgressIndicatorState();
}

class _CustomRefreshProgressIndicatorState
    extends State<CustomRefreshProgressIndicator>
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
    // _animationController.stop();
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
    final _grad = theme.backgroundGradient(widget.preset);
    final _color = theme.primaryColor(widget.preset);

    return _renderCenterIcon(
      color: _color,
      gradient: _grad,
      size: widget.size,
    );
  }

  Widget _renderCenterIcon({
    required Color color,
    required LinearGradient gradient,
    required double size,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Center(
            child: _renderInnerCircle(
              color: color,
              size: size,
            ),
          ),
          Center(
            child: _renderInnerCircle(
              color: color,
              noBackground: true,
              size: size / 1.5,
            ),
          ),
          Center(
            child: widget.enableAnimation
                ? RotationTransition(
                    turns: _animation,
                    child: _renderAnimatedCircle(
                      color: color,
                      size: size / 1.15,
                    ),
                  )
                : _renderAnimatedCircle(
                    color: color,
                    size: size / 1.15,
                  ),
          ),
          Center(
            child: widget.enableAnimation
                ? RotationTransition(
                    turns: Tween<double>(begin: 1, end: 0)
                        .animate(_animationController),
                    child: SvgPicture.asset(
                      Assets.images.progressArc,
                      color: color,
                    ),
                  )
                : SvgPicture.asset(Assets.images.progressArc),
          ),
        ],
      ),
    );
  }

  Widget _renderInnerCircle({
    required Color color,
    required double size,
    bool noBackground = false,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.2)),
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        gradient: noBackground
            ? const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                colors: [color.withOpacity(0.01), color.withOpacity(0.2)],
              ),
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

    final shadowPaint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final center = Offset(size.width / 2, size.height / 2);

    final path = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        vmath.radians(-90),
        vmath.radians(90),
      )
      ..addArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        vmath.radians(-270),
        vmath.radians(90),
      );

    canvas
      ..drawPath(path, shadowPaint)
      ..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
