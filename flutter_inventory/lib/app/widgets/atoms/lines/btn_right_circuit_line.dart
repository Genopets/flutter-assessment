import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class BtnRightCircuitLine extends StatelessWidget {
  const BtnRightCircuitLine(
      {Key? key, required this.size, this.colorPreset = ColorPresets.teal})
      : super(key: key);
  final Size size;
  final ColorPresets colorPreset;

  @override
  Widget build(BuildContext context) {
    final color = GenopetsTheme.of(context).opacityColor(colorPreset);
    return CustomPaint(
      size: size,
      painter: _BtnRightCircuitLinePainter(color),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _BtnRightCircuitLinePainter extends CustomPainter {
  _BtnRightCircuitLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.9134400, 0)
      ..lineTo(size.width * 0.9134400, size.height * 0.4240506)
      ..moveTo(size.width * 0.9134400, size.height * 0.4240506)
      ..cubicTo(
          size.width * 0.9558636,
          size.height * 0.4198316,
          size.width * 0.9736945,
          size.height * 0.3962025,
          size.width * 0.9736945,
          size.height * 0.3354430)
      ..cubicTo(
          size.width * 0.9736945,
          size.height * 0.2746835,
          size.width * 0.9736945,
          size.height * 0.09493671,
          size.width * 0.9736945,
          size.height * 0.01265823)
      ..moveTo(size.width * 0.9134400, size.height * 0.4240506)
      ..lineTo(size.width * 0.9134400, size.height * 0.4746835)
      ..lineTo(size.width * 0.9134400, size.height * 0.5253165)
      ..moveTo(size.width * 0.02162636, size.height)
      ..cubicTo(
          size.width * 0.02162636,
          size.height * 0.9594937,
          size.width * 0.07617182,
          size.height * 0.9409278,
          size.width * 0.1216264,
          size.height * 0.9367089)
      ..lineTo(size.width * 0.4125364, size.height * 0.9367089)
      ..moveTo(size.width * 0.4125364, size.height * 0.9367089)
      ..lineTo(size.width * 0.7489000, size.height * 0.9367089)
      ..cubicTo(
          size.width * 0.8296382,
          size.height * 0.9367089,
          size.width * 0.9134400,
          size.height * 0.9050633,
          size.width * 0.9134400,
          size.height * 0.8481013)
      ..lineTo(size.width * 0.9134400, size.height * 0.5253165)
      ..moveTo(size.width * 0.4125364, size.height * 0.9367089)
      ..cubicTo(
          size.width * 0.4185964,
          size.height * 0.9219405,
          size.width * 0.4300582,
          size.height * 0.8734177,
          size.width * 0.5100582,
          size.height * 0.8734177)
      ..cubicTo(
          size.width * 0.5900582,
          size.height * 0.8734177,
          size.width * 0.6822327,
          size.height * 0.8734177,
          size.width * 0.7489000,
          size.height * 0.8734177)
      ..cubicTo(
          size.width * 0.7701109,
          size.height * 0.8734177,
          size.width * 0.8307182,
          size.height * 0.8734177,
          size.width * 0.8307182,
          size.height * 0.8291139)
      ..cubicTo(
          size.width * 0.8307182,
          size.height * 0.7936709,
          size.width * 0.8307182,
          size.height * 0.6708861,
          size.width * 0.8307182,
          size.height * 0.5949367)
      ..cubicTo(
          size.width * 0.8313200,
          size.height * 0.5780595,
          size.width * 0.8778000,
          size.height * 0.5253165,
          size.width * 0.9134400,
          size.height * 0.5253165);

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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
