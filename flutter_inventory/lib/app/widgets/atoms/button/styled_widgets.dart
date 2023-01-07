import 'package:flutter/material.dart';

class ArcButtonShapeBorder extends ShapeBorder {
  const ArcButtonShapeBorder({
    this.borderWidth = 1.0,
    this.borderColor = Colors.transparent,
    this.borderRadius,
    this.gradient,
    this.inverse = false,
  });

  final double borderWidth;
  final Color borderColor;
  final BorderRadius? borderRadius;
  final LinearGradient? gradient;
  final bool inverse;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderWidth);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getShapePath(
      rect,
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getShapePath(
      rect,
      textDirection: textDirection,
    );
  }

  Path _getShapePath(Rect rect, {TextDirection? textDirection}) {
    rect = rect.deflate(borderWidth / 2.0);

    if (inverse) {
      return Path()
        ..moveTo(rect.width * 0.8979592, rect.height * 0.001305483)
        ..lineTo(rect.width * 0.1020408, rect.height * 0.001305483)
        ..cubicTo(
            rect.width * 0.04649038,
            rect.height * 0.001305483,
            rect.width * 0.001457726,
            rect.height * 0.04163499,
            rect.width * 0.001457726,
            rect.height * 0.09138381)
        ..lineTo(rect.width * 0.001457726, rect.height * 0.9973890)
        ..lineTo(rect.width * 0.06509009, rect.height * 0.9973890)
        ..cubicTo(
            rect.width * 0.1206029,
            rect.height * 0.9973890,
            rect.width * 0.1663837,
            rect.height * 0.9559478,
            rect.width * 0.1879388,
            rect.height * 0.9095901)
        ..cubicTo(
            rect.width * 0.2301845,
            rect.height * 0.82,
            rect.width * 0.345,
            rect.height * 0.668,
            rect.width * 0.56,
            rect.height * 0.706)
        ..cubicTo(
            rect.width * 0.6787609,
            rect.height * 0.7206266,
            rect.width * 0.7754431,
            rect.height * 0.8184151,
            rect.width * 0.8141283,
            rect.height * 0.9091540)
        ..cubicTo(
            rect.width * 0.8341166,
            rect.height * 0.9560418,
            rect.width * 0.8794052,
            rect.height * 0.9973890,
            rect.width * 0.9349096,
            rect.height * 0.9973890)
        ..lineTo(rect.width * 0.9985423, rect.height * 0.9973890)
        ..lineTo(rect.width * 0.9985423, rect.height * 0.09138381)
        ..cubicTo(
            rect.width * 0.9985423,
            rect.height * 0.04163499,
            rect.width * 0.9535102,
            rect.height * 0.001305483,
            rect.width * 0.8979592,
            rect.height * 0.001305483)
        ..close();
    }

    return Path()
      ..moveTo(rect.width * 0.8979592, rect.height * 0.9973890)
      ..lineTo(rect.width * 0.1020408, rect.height * 0.9973890)
      ..cubicTo(
          rect.width * 0.04649038,
          rect.height * 0.9973890,
          rect.width * 0.001457726,
          rect.height * 0.9570601,
          rect.width * 0.001457726,
          rect.height * 0.9073107)
      ..lineTo(rect.width * 0.001457726, rect.height * 0.001305483)
      ..lineTo(rect.width * 0.06509009, rect.height * 0.001305483)
      ..cubicTo(
          rect.width * 0.1206029,
          rect.height * 0.001305483,
          rect.width * 0.1663837,
          rect.height * 0.04274674,
          rect.width * 0.1879388,
          rect.height * 0.08910339)
      ..cubicTo(
          rect.width * 0.2301845,
          rect.height * 0.1799572,
          rect.width * 0.33,
          rect.height * 0.33,
          rect.width * 0.572,
          rect.height * 0.296)
      ..cubicTo(
          rect.width * 0.6787609,
          rect.height * 0.2780679,
          rect.width * 0.7754431,
          rect.height * 0.1802799,
          rect.width * 0.8141283,
          rect.height * 0.08954047)
      ..cubicTo(
          rect.width * 0.8341166,
          rect.height * 0.04265326,
          rect.width * 0.8794052,
          rect.height * 0.001305483,
          rect.width * 0.9349096,
          rect.height * 0.001305483)
      ..lineTo(rect.width * 0.9985423, rect.height * 0.001305483)
      ..lineTo(rect.width * 0.9985423, rect.height * 0.9073107)
      ..cubicTo(
          rect.width * 0.9985423,
          rect.height * 0.9570601,
          rect.width * 0.9535102,
          rect.height * 0.9973890,
          rect.width * 0.8979592,
          rect.height * 0.9973890)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = _getShapePath(
      rect,
      textDirection: textDirection,
    );

    final paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..color = borderColor;
    canvas.drawPath(path, paintStroke);

    final tempGrad = gradient != null
        ? LinearGradient(
            colors: gradient!.colors,
          )
        : const LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
          );
    final grad = inverse
        ? LinearGradient(
            colors: tempGrad.colors,
            begin: Alignment.bottomLeft,
          )
        : tempGrad;

    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..shader = grad.createShader(
        rect,
        textDirection: textDirection,
      );

    canvas.drawPath(path, paintFill);
  }

  @override
  ShapeBorder scale(double t) {
    return ArcButtonShapeBorder(
      borderWidth: borderWidth * t,
      borderRadius: (borderRadius ?? BorderRadius.zero) * t,
    );
  }
}
