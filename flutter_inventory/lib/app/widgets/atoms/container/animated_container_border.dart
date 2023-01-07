import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class AnimatedBorderContainer extends StatefulWidget {
  const AnimatedBorderContainer({
    Key? key,
    required this.child,
    required this.borderRadius,
    this.preset = ColorPresets.teal,
    this.animationDuration,
    this.opacity = 1,
    this.strokeWidth = 2,
  }) : super(key: key);

  final Widget child;
  final BorderRadius borderRadius;
  final ColorPresets preset;
  final Duration? animationDuration;
  final double opacity;
  final double strokeWidth;

  @override
  State<AnimatedBorderContainer> createState() =>
      _AnimatedBorderContainerState();
}

class _AnimatedBorderContainerState extends State<AnimatedBorderContainer>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 700),
    );
    Future.delayed(const Duration(milliseconds: 300), _startAnimation1);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _startAnimation1() {
    if (!mounted) return;
    final _ = _animationController?.animateTo(1, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _AnimatedBorderPainter(
        animation: _animationController!,
        strokeColor: GenopetsTheme.of(context)
            .opacityColor(widget.preset)
            .withOpacity(.5),
        pathType: PathType.rRect,
        radius: widget.borderRadius,
        animationDirection: AnimationDirection.counterclockwise,
        startingPercentage: 15,
        opacity: widget.opacity,
        strokeWidth: widget.strokeWidth,
      ),
      child: widget.child,
    );
  }
}

class _AnimatedBorderPainter extends CustomPainter {
  _AnimatedBorderPainter(
      {required this.animation,
      this.pathType = PathType.rect,
      this.strokeWidth = 2.0,
      this.strokeColor = Colors.blueGrey,
      this.radius,
      this.startingPercentage = 0,
      this.animationDirection = AnimationDirection.clockwise,
      this.opacity = 1})
      : assert(strokeWidth > 0, 'strokeWidth must be greater than 0.'),
        assert(startingPercentage >= 0 && startingPercentage <= 100,
            'startingPercentage must lie between 0 and 100.'),
        super(repaint: animation);

  final Animation<double> animation;
  final PathType pathType;
  final double strokeWidth;
  final Color strokeColor;
  final BorderRadius? radius;
  final int startingPercentage;
  final AnimationDirection animationDirection;
  Path? _originalPath;
  double opacity;

  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;

    if (animationPercent == 0.0 || animationPercent == 1.0) {
      _originalPath = _createOriginalPath(size);
      _paint = Paint()
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..color = strokeColor.withOpacity(opacity);
    }
    if (_originalPath == null) return;
    final currentPath = _createAnimatedPath(
      _originalPath!,
      animationPercent,
    );

    canvas.drawPath(currentPath, _paint);
  }

  @override
  bool shouldRepaint(_AnimatedBorderPainter oldDelegate) => true;

  Path _createOriginalPath(Size size) {
    switch (pathType) {
      case PathType.rect:
        return _createOriginalPathRect(size);
      case PathType.rRect:
        return _createOriginalPathRRect(size);
      case PathType.circle:
        return _createOriginalPathCircle(size);
    }
  }

  Path _createOriginalPathRect(Size size) {
    final originalPath = Path()
      ..addRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..lineTo(0, -(strokeWidth / 2));
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(
          originalPath, PathType.rect, size);
    }
    return originalPath;
  }

  Path _createOriginalPathRRect(Size size) {
    final originalPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          bottomLeft: radius?.bottomLeft ?? const Radius.circular(4),
          topLeft: radius?.topLeft ?? const Radius.circular(4),
          bottomRight: radius?.bottomRight ?? const Radius.circular(4),
          topRight: radius?.topRight ?? const Radius.circular(4),
        ),
      );
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(
          originalPath, PathType.rRect, size);
    }
    return originalPath;
  }

  Path _createOriginalPathCircle(Size size) {
    final originalPath = Path()
      ..addOval(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    if (startingPercentage > 0 && startingPercentage < 100) {
      return _createPathForStartingPercentage(
          originalPath, PathType.circle, size);
    }
    return originalPath;
  }

  Path _createPathForStartingPercentage(Path originalPath, PathType pathType,
      [Size? size]) {
    final pathMetrics = originalPath.computeMetrics().first;
    final pathCutoffPoint = ((size?.height ?? 0) * 100.0) / 100;
    final firstSubPath = pathMetrics.extractPath(0, pathCutoffPoint);
    final secondSubPath =
        pathMetrics.extractPath(pathCutoffPoint, pathMetrics.length);
    if (pathType == PathType.rect) {
      final path = Path()
        ..addPath(secondSubPath, Offset.zero)
        ..lineTo(0, -(strokeWidth / 2))
        ..addPath(firstSubPath, Offset.zero);
      switch (startingPercentage) {
        case 25:
          path.lineTo(size!.width + strokeWidth / 2, 0);
          break;
        case 50:
          path.lineTo(size!.width - strokeWidth / 2, size.height);
          break;
        case 75:
          path.lineTo(0, size!.height + strokeWidth / 2);
          break;
        default:
      }
      return path;
    }
    return Path()
      ..addPath(secondSubPath, Offset.zero)
      ..addPath(firstSubPath, Offset.zero);
  }

  Path _createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath.computeMetrics().fold<double>(
        0, (double prev, PathMetric metric) => prev + metric.length);
    final currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(originalPath, currentLength);
  }

  Path _extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    final metricsIterator = animationDirection == AnimationDirection.clockwise
        ? originalPath.computeMetrics().iterator
        : originalPath.computeMetrics().toList().reversed.iterator;

    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;

      final nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = animationDirection == AnimationDirection.clockwise
            ? metric.extractPath(0, remainingLength)
            : metric.extractPath(
                metric.length - remainingLength, metric.length);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}

enum PathType {
  rect,
  rRect,
  circle,
}

enum AnimationDirection {
  clockwise,
  counterclockwise,
}
