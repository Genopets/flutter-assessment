import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class BtnLeftCircuitLine extends StatelessWidget {
  const BtnLeftCircuitLine(
      {Key? key, required this.size, this.colorPreset = ColorPresets.teal})
      : super(key: key);
  final Size size;
  final ColorPresets colorPreset;

  @override
  Widget build(BuildContext context) {
    final color = GenopetsTheme.of(context).opacityColor(colorPreset);
    return CustomPaint(
      size: size,
      painter: _BtnLeftCircuitLinePainter(color),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _BtnLeftCircuitLinePainter extends CustomPainter {
  _BtnLeftCircuitLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.07753692, 0)
      ..lineTo(size.width * 0.07753692, size.height * 0.05715082)
      ..lineTo(size.width * 0.07754077, size.height * 0.7392410)
      ..cubicTo(
          size.width * 0.06523315,
          size.height * 0.8072066,
          size.width * 0.2320831,
          size.height * 0.9836066,
          size.width,
          size.height * 0.9836066);

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
    canvas.drawPath(path_0, paint0Stroke);

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.4615385, 0)
      ..lineTo(size.width * 0.4615385, size.height * 0.5229295)
      ..cubicTo(
          size.width * 0.4615385,
          size.height * 0.5851836,
          size.width * 0.4769231,
          size.height * 0.6972393,
          size.width * 0.07692308,
          size.height * 0.6972393);

    final paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
    canvas.drawPath(path_1, paint1Stroke);

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
