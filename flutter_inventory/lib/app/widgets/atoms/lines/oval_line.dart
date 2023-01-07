import 'package:flutter/material.dart';

class OvalLine extends StatelessWidget {
  const OvalLine({
    Key? key,
    this.width = 100,
    required this.color,
  }) : super(key: key);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width,
        minHeight: width,
      ),
      child: Center(
          child: AspectRatio(
        aspectRatio: 164 / 188,
        child: CustomPaint(
          size: const Size(164, 188),
          painter: _RPSCustomPainter(color: color),
        ),
      )),
    );
  }
}

class _RPSCustomPainter extends CustomPainter {
  const _RPSCustomPainter({
    required this.color,
  }) : super();

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(154.715, 136.831)
      ..cubicTo(131.077, 176.993, 79.3573, 190.387, 39.1961, 166.75)
      ..moveTo(9.27793, 51.231)
      ..cubicTo(32.9158, 11.0698, 84.6352, -2.325, 124.796, 21.3129);

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
    canvas.drawPath(
      path_0,
      paint0Stroke,
    );

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*
class _RPSCustomPainter extends CustomPainter {
  const _RPSCustomPainter({
    required this.color,
  }) : super();

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.9433841, size.height * 0.6278245)
      ..cubicTo(
        size.width * 0.7992500,
        size.height * 0.9414521,
        size.width * 0.4838860,
        size.height * 1.012697,
        size.width * 0.2390006,
        size.height * 0.8869681,
      )
      ..moveTo(size.width * 0.05657274, size.height * 0.2725053)
      ..cubicTo(
        size.width * 0.2007061,
        size.height * 0.05888191,
        size.width * 0.5160683,
        size.height * -0.01236702,
        size.width * 0.7609512,
        size.height * 0.1133665,
      );

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
    canvas.drawPath(path_0, paint0Stroke);

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/
