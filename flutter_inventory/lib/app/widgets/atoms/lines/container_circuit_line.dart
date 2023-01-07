import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class CircuitCurvedLine extends StatelessWidget {
  const CircuitCurvedLine(
      {Key? key, required this.size, this.colorPreset = ColorPresets.teal})
      : super(key: key);
  final Size size;
  final ColorPresets colorPreset;

  @override
  Widget build(BuildContext context) {
    final color = GenopetsTheme.of(context).opacityColor(colorPreset);
    return CustomPaint(
      size: size,
      painter: _CircuitCurvedLinePainter(color),
    );
  }
}

class _CircuitCurvedLinePainter extends CustomPainter {
  _CircuitCurvedLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final staticHeight = size.height;
    final path_0 = Path()
      ..moveTo(size.width * 0.4693071, staticHeight * 0.2587873)
      ..lineTo(size.width * 0.4693071, size.height * 0.4738964)
      ..cubicTo(
          size.width * 0.4694476,
          size.height * 0.4982590,
          size.width * 0.4119262,
          size.height * 0.5216414,
          size.width * 0.3093214,
          size.height * 0.5389283)
      ..lineTo(size.width * 0.1783631, size.height * 0.5610797)
      ..cubicTo(
          size.width * 0.07565405,
          size.height * 0.5784104,
          size.width * 0.01791490,
          size.height * 0.6018207,
          size.width * 0.01766890,
          size.height * 0.6262271)
      ..lineTo(size.width * 0.01766890, size.height);

    final paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = color;
    canvas.drawPath(path_0, paint0Stroke);

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.9734000, staticHeight * 0.003993785)
      ..lineTo(size.width * 0.6314857, staticHeight * 0.06132550)
      ..cubicTo(
          size.width * 0.5801048,
          staticHeight * 0.06990598,
          size.width * 0.5393429,
          staticHeight * 0.08009761,
          size.width * 0.5115262,
          staticHeight * 0.09131753)
      ..cubicTo(
          size.width * 0.4837095,
          staticHeight * 0.1025371,
          size.width * 0.4693857,
          staticHeight * 0.1145641,
          size.width * 0.4693786,
          staticHeight * 0.1267108)
      ..lineTo(size.width * 0.4693786, staticHeight * 0.2069036);

    final paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = color;
    canvas.drawPath(path_1, paint1Stroke);

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    final path_2 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2290546)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2290546)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2260932)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2260932)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2290546)
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_2, paint2Fill);

    final path_3 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2231327)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2231327)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2201717)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2201717)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2231327)
      ..close();

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_3, paint3Fill);

    final path_4 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2172092)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2172092)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2142478)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2142478)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2172092)
      ..close();

    final paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_4, paint4Fill);

    final path_5 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2527450)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2527450)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2497837)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2497837)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2527450)
      ..close();

    final paint5Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_5, paint5Fill);

    final path_6 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2602072)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2602072)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2572458)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2572458)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2602072)
      ..close();

    final paint6Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_6, paint6Fill);

    final path_7 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2098657)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2098657)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2069044)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2069044)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2098657)
      ..close();

    final paint7Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_7, paint7Fill);

    final path_8 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2468231)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2468231)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2438618)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2438618)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2468231)
      ..close();

    final paint8Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_8, paint8Fill);

    final path_9 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2408996)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2408996)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2379382)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2379382)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2408996)
      ..close();

    final paint9Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_9, paint9Fill);

    final path_10 = Path()
      ..moveTo(size.width * 0.4785071, staticHeight * 0.2349781)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2349781)
      ..lineTo(size.width * 0.4601000, staticHeight * 0.2320167)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2320167)
      ..lineTo(size.width * 0.4785071, staticHeight * 0.2349781)
      ..close();

    final paint10Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_10, paint10Fill);

    final path_11 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.4793466)
      ..lineTo(size.width * 0.07077762, size.height * 0.4793466)
      ..lineTo(
          size.width * 0.07077762,
          (size.height * 0.4793466) +
              (staticHeight * 0.4911912 - staticHeight * 0.4793466))
      ..lineTo(
          size.width * -0.00001221043,
          (size.height * 0.4793466) +
              (staticHeight * 0.4911912 - staticHeight * 0.4793466))
      ..lineTo(size.width * -0.00001221043, size.height * 0.4793466)
      ..close();

    final paint11Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_11, paint11Fill);

    final path_12 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.4897689)
      ..lineTo(size.width * 0.009207595, size.height * 0.4897689)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.4897689) +
              (staticHeight * 0.4882311 - staticHeight * 0.4897689))
      ..lineTo(
          size.width * 0.01841060,
          (size.height * 0.4897689) +
              (staticHeight * 0.4882311 - staticHeight * 0.4897689))
      ..lineTo(size.width * 0.01841060, size.height * 0.4897689)
      ..close();

    final paint12Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_12, paint12Fill);

    final path_13 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.4971116)
      ..lineTo(size.width * 0.04454976, size.height * 0.4971116)
      ..lineTo(
          size.width * 0.04454976,
          (size.height * 0.4971116) +
              (staticHeight * 0.4955737 - staticHeight * 0.4971116))
      ..lineTo(
          size.width * 0.05375286,
          (size.height * 0.4971116) +
              (staticHeight * 0.4955737 - staticHeight * 0.4971116))
      ..lineTo(size.width * 0.05375286, size.height * 0.4971116)
      ..close();

    final paint13Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_13, paint13Fill);

    final path_14 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.4971116)
      ..lineTo(size.width * 0.01767114, size.height * 0.4971116)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.4971116) +
              (staticHeight * 0.4955737 - staticHeight * 0.4971116))
      ..lineTo(
          size.width * 0.02687405,
          (size.height * 0.4971116) +
              (staticHeight * 0.4955737 - staticHeight * 0.4971116))
      ..lineTo(size.width * 0.02687405, size.height * 0.4971116)
      ..close();

    final paint14Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_14, paint14Fill);

    final path_15 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.5193825)
      ..lineTo(size.width * 0.04454976, size.height * 0.5193825)
      ..lineTo(
          size.width * 0.04454976,
          (size.height * 0.5193825) +
              (staticHeight * 0.5178446 - staticHeight * 0.5193825))
      ..lineTo(
          size.width * 0.05375286,
          (size.height * 0.5193825) +
              (staticHeight * 0.5178446 - staticHeight * 0.5193825))
      ..lineTo(size.width * 0.05375286, size.height * 0.5193825)
      ..close();

    final paint15Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_15, paint15Fill);

    final path_16 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.5193825)
      ..lineTo(size.width * 0.01767114, size.height * 0.5193825)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.5193825) +
              (staticHeight * 0.5178446 - staticHeight * 0.5193825))
      ..lineTo(
          size.width * 0.02687405,
          (size.height * 0.5193825) +
              (staticHeight * 0.5178446 - staticHeight * 0.5193825))
      ..lineTo(size.width * 0.02687405, size.height * 0.5193825)
      ..close();

    final paint16Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_16, paint16Fill);

    final path_17 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.5415339)
      ..lineTo(size.width * 0.04454976, size.height * 0.5415339)
      ..lineTo(
          size.width * 0.04454976,
          (size.height * 0.5415339) +
              (staticHeight * 0.5399920 - staticHeight * 0.5415339))
      ..lineTo(
          size.width * 0.05375286,
          (size.height * 0.5415339) +
              (staticHeight * 0.5399920 - staticHeight * 0.5415339))
      ..lineTo(size.width * 0.05375286, size.height * 0.5415339)
      ..close();

    final paint17Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_17, paint17Fill);

    final path_18 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.5415339)
      ..lineTo(size.width * 0.01767114, size.height * 0.5415339)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.5415339) +
              (staticHeight * 0.5399920 - staticHeight * 0.5415339))
      ..lineTo(
          size.width * 0.02687405,
          (size.height * 0.5415339) +
              (staticHeight * 0.5399920 - staticHeight * 0.5415339))
      ..lineTo(size.width * 0.02687405, size.height * 0.5415339)
      ..close();

    final paint18Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_18, paint18Fill);

    final path_19 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.4823068)
      ..lineTo(size.width * 0.05310643, size.height * 0.4823068)
      ..lineTo(
          size.width * 0.05310643,
          (size.height * 0.4823068) +
              (staticHeight * 0.4807689 - staticHeight * 0.4823068))
      ..lineTo(
          size.width * 0.06230952,
          (size.height * 0.4823068) +
              (staticHeight * 0.4807689 - staticHeight * 0.4823068))
      ..lineTo(size.width * 0.06230952, size.height * 0.4823068)
      ..close();

    final paint19Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_19, paint19Fill);

    final path_20 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.4882311)
      ..lineTo(size.width * 0.009207595, size.height * 0.4882311)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.4882311) +
              (staticHeight * 0.4807689 - staticHeight * 0.4882311))
      ..lineTo(
          size.width * 0.05380548,
          (size.height * 0.4882311) +
              (staticHeight * 0.4807689 - staticHeight * 0.4882311))
      ..lineTo(size.width * 0.05380548, size.height * 0.4882311)
      ..close();

    final paint20Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_20, paint20Fill);

    final path_21 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.4897689)
      ..lineTo(size.width * 0.01767114, size.height * 0.4897689)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.4897689) +
              (staticHeight * 0.4823068 - staticHeight * 0.4897689))
      ..lineTo(
          size.width * 0.06226905,
          (size.height * 0.4897689) +
              (staticHeight * 0.4823068 - staticHeight * 0.4897689))
      ..lineTo(size.width * 0.06226905, size.height * 0.4897689)
      ..close();

    final paint21Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_21, paint21Fill);

    final path_22 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5016135)
      ..lineTo(size.width * 0.07077762, size.height * 0.5016135)
      ..lineTo(
          size.width * 0.07077762,
          (size.height * 0.5016135) +
              (staticHeight * 0.5134582 - staticHeight * 0.5016135))
      ..lineTo(
          size.width * -0.00001221043,
          (size.height * 0.5016135) +
              (staticHeight * 0.5134582 - staticHeight * 0.5016135))
      ..lineTo(size.width * -0.00001221043, size.height * 0.5016135)
      ..close();

    final paint22Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_22, paint22Fill);

    final path_23 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5119203)
      ..lineTo(size.width * 0.009207595, size.height * 0.5119203)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5119203) +
              (staticHeight * 0.5103825 - staticHeight * 0.5119203))
      ..lineTo(
          size.width * 0.01841060,
          (size.height * 0.5119203) +
              (staticHeight * 0.5103825 - staticHeight * 0.5119203))
      ..lineTo(size.width * 0.01841060, size.height * 0.5119203)
      ..close();

    final paint23Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_23, paint23Fill);

    final path_24 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5045777)
      ..lineTo(size.width * 0.05310643, size.height * 0.5045777)
      ..lineTo(
          size.width * 0.05310643,
          (size.height * 0.5045777) +
              (staticHeight * 0.5030359 - staticHeight * 0.5045777))
      ..lineTo(
          size.width * 0.06230952,
          (size.height * 0.5045777) +
              (staticHeight * 0.5030359 - staticHeight * 0.5045777))
      ..lineTo(size.width * 0.06230952, size.height * 0.5045777)
      ..close();

    final paint24Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_24, paint24Fill);

    final path_25 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5104980)
      ..lineTo(size.width * 0.009207595, size.height * 0.5104980)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5104980) +
              (staticHeight * 0.5030359 - staticHeight * 0.5104980))
      ..lineTo(
          size.width * 0.05380548,
          (size.height * 0.5104980) +
              (staticHeight * 0.5030359 - staticHeight * 0.5104980))
      ..lineTo(size.width * 0.05380548, size.height * 0.5104980)
      ..close();

    final paint25Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_25, paint25Fill);

    final path_26 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5119203)
      ..lineTo(size.width * 0.01767114, size.height * 0.5119203)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.5119203) +
              (staticHeight * 0.5044582 - staticHeight * 0.5119203))
      ..lineTo(
          size.width * 0.06226905,
          (size.height * 0.5119203) +
              (staticHeight * 0.5044582 - staticHeight * 0.5119203))
      ..lineTo(size.width * 0.06226905, size.height * 0.5119203)
      ..close();

    final paint26Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_26, paint26Fill);

    final path_27 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5237649)
      ..lineTo(size.width * 0.07077762, size.height * 0.5237649)
      ..lineTo(
          size.width * 0.07077762,
          (size.height * 0.5237649) +
              (staticHeight * 0.5356135 - staticHeight * 0.5237649))
      ..lineTo(
          size.width * -0.00001221043,
          (size.height * 0.5237649) +
              (staticHeight * 0.5356135 - staticHeight * 0.5237649))
      ..lineTo(size.width * -0.00001221043, size.height * 0.5237649)
      ..close();

    final paint27Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_27, paint27Fill);

    final path_28 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5341912)
      ..lineTo(size.width * 0.009207595, size.height * 0.5341912)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5341912) +
              (staticHeight * 0.5326494 - staticHeight * 0.5341912))
      ..lineTo(
          size.width * 0.01841060,
          (size.height * 0.5341912) +
              (staticHeight * 0.5326494 - staticHeight * 0.5341912))
      ..lineTo(size.width * 0.01841060, size.height * 0.5341912)
      ..close();

    final paint28Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_28, paint28Fill);

    final path_29 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5267251)
      ..lineTo(size.width * 0.05310643, size.height * 0.5267251)
      ..lineTo(
          size.width * 0.05310643,
          (size.height * 0.5267251) +
              (staticHeight * 0.5251873 - staticHeight * 0.5267251))
      ..lineTo(
          size.width * 0.06230952,
          (size.height * 0.5267251) +
              (staticHeight * 0.5251873 - staticHeight * 0.5267251))
      ..lineTo(size.width * 0.06230952, size.height * 0.5267251)
      ..close();

    final paint29Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_29, paint29Fill);

    final path_30 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5326494)
      ..lineTo(size.width * 0.009207595, size.height * 0.5326494)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5326494) +
              (staticHeight * 0.5251873 - staticHeight * 0.5326494))
      ..lineTo(
          size.width * 0.05380548,
          (size.height * 0.5326494) +
              (staticHeight * 0.5251873 - staticHeight * 0.5326494))
      ..lineTo(size.width * 0.05380548, size.height * 0.5326494)
      ..close();

    final paint30Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_30, paint30Fill);

    final path_31 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5341912)
      ..lineTo(size.width * 0.01767114, size.height * 0.5341912)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.5341912) +
              (staticHeight * 0.5267251 - staticHeight * 0.5341912))
      ..lineTo(
          size.width * 0.06226905,
          (size.height * 0.5341912) +
              (staticHeight * 0.5267251 - staticHeight * 0.5341912))
      ..lineTo(size.width * 0.06226905, size.height * 0.5341912)
      ..close();

    final paint31Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_31, paint31Fill);

    ///Last Dot

    final path_32 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5460359)
      ..lineTo(size.width * 0.07077762, size.height * 0.5460359)
      ..lineTo(
          size.width * 0.07077762,
          (size.height * 0.5460359) +
              (staticHeight * 0.5578805 - staticHeight * 0.5460359))
      ..lineTo(
          size.width * -0.00001221043,
          (size.height * 0.5460359) +
              (staticHeight * 0.5578805 - staticHeight * 0.5460359))
      ..lineTo(size.width * -0.00001221043, size.height * 0.5460359)
      ..close();

    final paint32Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_32, paint32Fill);

    final path_33 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5563426)
      ..lineTo(size.width * 0.009207595, size.height * 0.5563426)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5563426) +
              (staticHeight * 0.5548008 - staticHeight * 0.5563426))
      ..lineTo(
          size.width * 0.01841060,
          (size.height * 0.5563426) +
              (staticHeight * 0.5548008 - staticHeight * 0.5563426))
      ..lineTo(size.width * 0.01841060, size.height * 0.5563426)
      ..close();

    final paint33Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_33, paint33Fill);

    final path_34 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5489960)
      ..lineTo(size.width * 0.05310643, size.height * 0.5489960)
      ..lineTo(
          size.width * 0.05310643,
          (size.height * 0.5489960) +
              (staticHeight * 0.5474542 - staticHeight * 0.5489960))
      ..lineTo(
          size.width * 0.06230952,
          (size.height * 0.5489960) +
              (staticHeight * 0.5474542 - staticHeight * 0.5489960))
      ..lineTo(size.width * 0.06230952, size.height * 0.5489960)
      ..close();

    final paint34Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_34, paint34Fill);

    final path_35 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5549203)
      ..lineTo(size.width * 0.009207595, size.height * 0.5549203)
      ..lineTo(
          size.width * 0.009207595,
          (size.height * 0.5549203) +
              (staticHeight * 0.5474582 - staticHeight * 0.5549203))
      ..lineTo(
          size.width * 0.05380548,
          (size.height * 0.5549203) +
              (staticHeight * 0.5474582 - staticHeight * 0.5549203))
      ..lineTo(size.width * 0.05380548, size.height * 0.5549203)
      ..close();

    final paint35Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_35, paint35Fill);

    final path_36 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5563426)
      ..lineTo(size.width * 0.01767114, size.height * 0.5563426)
      ..lineTo(
          size.width * 0.01767114,
          (size.height * 0.5563426) +
              (staticHeight * 0.5488765 - staticHeight * 0.5563426))
      ..lineTo(
          size.width * 0.06226905,
          (size.height * 0.5563426) +
              (staticHeight * 0.5488765 - staticHeight * 0.5563426))
      ..lineTo(size.width * 0.06226905, size.height * 0.5563426)
      ..close();

    final paint36Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_36, paint36Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
