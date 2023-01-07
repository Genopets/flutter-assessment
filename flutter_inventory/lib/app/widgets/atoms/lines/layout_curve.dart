import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

//Add this CustomPaint widget to the Widget Tree
class LayoutBorderCurveLines extends StatelessWidget {
  const LayoutBorderCurveLines({
    Key? key,
    this.width = 50,
    this.color,
    this.colorPreset = ColorPresets.teal,
  }) : super(key: key);
  final double width;
  final ColorPresets colorPreset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final _color = theme.primaryColor(colorPreset);

    return CustomPaint(
      size: Size(
        width,
        (width * 5.976190476190476).toDouble(),
      ),
      painter: _RPSCustomPainter(color: color ?? _color),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _RPSCustomPainter extends CustomPainter {
  _RPSCustomPainter({this.color = const Color(0xff00FFC8)});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.4693071, size.height * 0.2587773)
      ..lineTo(size.width * 0.4693071, size.height * 0.4738884)
      ..cubicTo(
          size.width * 0.4694476,
          size.height * 0.4982510,
          size.width * 0.4119262,
          size.height * 0.5216335,
          size.width * 0.3093214,
          size.height * 0.5389203)
      ..lineTo(size.width * 0.1783631, size.height * 0.5610677)
      ..cubicTo(
          size.width * 0.07565405,
          size.height * 0.5784024,
          size.width * 0.01791490,
          size.height * 0.6018088,
          size.width * 0.01766890,
          size.height * 0.6262191)
      ..lineTo(size.width * 0.01766890, size.height * 0.9982789);

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
      ..moveTo(size.width * 0.9734000, size.height * 0.003984064)
      ..lineTo(size.width * 0.6314857, size.height * 0.06131554)
      ..cubicTo(
          size.width * 0.5801048,
          size.height * 0.06989641,
          size.width * 0.5393429,
          size.height * 0.08008805,
          size.width * 0.5115262,
          size.height * 0.09130757)
      ..cubicTo(
          size.width * 0.4837095,
          size.height * 0.1025275,
          size.width * 0.4693857,
          size.height * 0.1145542,
          size.width * 0.4693786,
          size.height * 0.1267012)
      ..lineTo(size.width * 0.4693786, size.height * 0.2068940);

    final paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
    canvas.drawPath(path_1, paint1Stroke);

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    final path_2 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2290446)
      ..lineTo(size.width * 0.4601000, size.height * 0.2290446)
      ..lineTo(size.width * 0.4601000, size.height * 0.2260833)
      ..lineTo(size.width * 0.4785071, size.height * 0.2260833)
      ..lineTo(size.width * 0.4785071, size.height * 0.2290446)
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_2, paint2Fill);

    final path_3 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2231231)
      ..lineTo(size.width * 0.4601000, size.height * 0.2231231)
      ..lineTo(size.width * 0.4601000, size.height * 0.2201618)
      ..lineTo(size.width * 0.4785071, size.height * 0.2201618)
      ..lineTo(size.width * 0.4785071, size.height * 0.2231231)
      ..close();

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_3, paint3Fill);

    final path_4 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2171996)
      ..lineTo(size.width * 0.4601000, size.height * 0.2171996)
      ..lineTo(size.width * 0.4601000, size.height * 0.2142382)
      ..lineTo(size.width * 0.4785071, size.height * 0.2142382)
      ..lineTo(size.width * 0.4785071, size.height * 0.2171996)
      ..close();

    final paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_4, paint4Fill);

    final path_5 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2527351)
      ..lineTo(size.width * 0.4601000, size.height * 0.2527351)
      ..lineTo(size.width * 0.4601000, size.height * 0.2497737)
      ..lineTo(size.width * 0.4785071, size.height * 0.2497737)
      ..lineTo(size.width * 0.4785071, size.height * 0.2527351)
      ..close();

    final paint5Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_5, paint5Fill);

    final path_6 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2601976)
      ..lineTo(size.width * 0.4601000, size.height * 0.2601976)
      ..lineTo(size.width * 0.4601000, size.height * 0.2572363)
      ..lineTo(size.width * 0.4785071, size.height * 0.2572363)
      ..lineTo(size.width * 0.4785071, size.height * 0.2601976)
      ..close();

    final paint6Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_6, paint6Fill);

    final path_7 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2098558)
      ..lineTo(size.width * 0.4601000, size.height * 0.2098558)
      ..lineTo(size.width * 0.4601000, size.height * 0.2068944)
      ..lineTo(size.width * 0.4785071, size.height * 0.2068944)
      ..lineTo(size.width * 0.4785071, size.height * 0.2098558)
      ..close();

    final paint7Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_7, paint7Fill);

    final path_8 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2468135)
      ..lineTo(size.width * 0.4601000, size.height * 0.2468135)
      ..lineTo(size.width * 0.4601000, size.height * 0.2438522)
      ..lineTo(size.width * 0.4785071, size.height * 0.2438522)
      ..lineTo(size.width * 0.4785071, size.height * 0.2468135)
      ..close();

    final paint8Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_8, paint8Fill);

    final path_9 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2408900)
      ..lineTo(size.width * 0.4601000, size.height * 0.2408900)
      ..lineTo(size.width * 0.4601000, size.height * 0.2379287)
      ..lineTo(size.width * 0.4785071, size.height * 0.2379287)
      ..lineTo(size.width * 0.4785071, size.height * 0.2408900)
      ..close();

    final paint9Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_9, paint9Fill);

    final path_10 = Path()
      ..moveTo(size.width * 0.4785071, size.height * 0.2349685)
      ..lineTo(size.width * 0.4601000, size.height * 0.2349685)
      ..lineTo(size.width * 0.4601000, size.height * 0.2320072)
      ..lineTo(size.width * 0.4785071, size.height * 0.2320072)
      ..lineTo(size.width * 0.4785071, size.height * 0.2349685)
      ..close();

    final paint10Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_10, paint10Fill);

    final path_11 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.4793347)
      ..lineTo(size.width * 0.07077762, size.height * 0.4793347)
      ..lineTo(size.width * 0.07077762, size.height * 0.4911833)
      ..lineTo(size.width * -0.00001221043, size.height * 0.4911833)
      ..lineTo(size.width * -0.00001221043, size.height * 0.4793347)
      ..close();

    final paint11Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_11, paint11Fill);

    final path_12 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.4897610)
      ..lineTo(size.width * 0.009207595, size.height * 0.4897610)
      ..lineTo(size.width * 0.009207595, size.height * 0.4882191)
      ..lineTo(size.width * 0.01841060, size.height * 0.4882191)
      ..lineTo(size.width * 0.01841060, size.height * 0.4897610)
      ..close();

    final paint12Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_12, paint12Fill);

    final path_13 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.4971036)
      ..lineTo(size.width * 0.04454976, size.height * 0.4971036)
      ..lineTo(size.width * 0.04454976, size.height * 0.4955618)
      ..lineTo(size.width * 0.05375286, size.height * 0.4955618)
      ..lineTo(size.width * 0.05375286, size.height * 0.4971036)
      ..close();

    final paint13Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_13, paint13Fill);

    final path_14 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.4971036)
      ..lineTo(size.width * 0.01767114, size.height * 0.4971036)
      ..lineTo(size.width * 0.01767114, size.height * 0.4955618)
      ..lineTo(size.width * 0.02687405, size.height * 0.4955618)
      ..lineTo(size.width * 0.02687405, size.height * 0.4971036)
      ..close();

    final paint14Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_14, paint14Fill);

    final path_15 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.5193745)
      ..lineTo(size.width * 0.04454976, size.height * 0.5193745)
      ..lineTo(size.width * 0.04454976, size.height * 0.5178327)
      ..lineTo(size.width * 0.05375286, size.height * 0.5178327)
      ..lineTo(size.width * 0.05375286, size.height * 0.5193745)
      ..close();

    final paint15Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_15, paint15Fill);

    final path_16 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.5193745)
      ..lineTo(size.width * 0.01767114, size.height * 0.5193745)
      ..lineTo(size.width * 0.01767114, size.height * 0.5178327)
      ..lineTo(size.width * 0.02687405, size.height * 0.5178327)
      ..lineTo(size.width * 0.02687405, size.height * 0.5193745)
      ..close();

    final paint16Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_16, paint16Fill);

    final path_17 = Path()
      ..moveTo(size.width * 0.05375286, size.height * 0.5415219)
      ..lineTo(size.width * 0.04454976, size.height * 0.5415219)
      ..lineTo(size.width * 0.04454976, size.height * 0.5399841)
      ..lineTo(size.width * 0.05375286, size.height * 0.5399841)
      ..lineTo(size.width * 0.05375286, size.height * 0.5415219)
      ..close();

    final paint17Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_17, paint17Fill);

    final path_18 = Path()
      ..moveTo(size.width * 0.02687405, size.height * 0.5415219)
      ..lineTo(size.width * 0.01767114, size.height * 0.5415219)
      ..lineTo(size.width * 0.01767114, size.height * 0.5399841)
      ..lineTo(size.width * 0.02687405, size.height * 0.5399841)
      ..lineTo(size.width * 0.02687405, size.height * 0.5415219)
      ..close();

    final paint18Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_18, paint18Fill);

    final path_19 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.4822988)
      ..lineTo(size.width * 0.05310643, size.height * 0.4822988)
      ..lineTo(size.width * 0.05310643, size.height * 0.4807570)
      ..lineTo(size.width * 0.06230952, size.height * 0.4807570)
      ..lineTo(size.width * 0.06230952, size.height * 0.4822988)
      ..close();

    final paint19Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_19, paint19Fill);

    final path_20 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.4882191)
      ..lineTo(size.width * 0.009207595, size.height * 0.4882191)
      ..lineTo(size.width * 0.009207595, size.height * 0.4807570)
      ..lineTo(size.width * 0.05380548, size.height * 0.4807570)
      ..lineTo(size.width * 0.05380548, size.height * 0.4882191)
      ..close();

    final paint20Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_20, paint20Fill);

    final path_21 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.4897610)
      ..lineTo(size.width * 0.01767114, size.height * 0.4897610)
      ..lineTo(size.width * 0.01767114, size.height * 0.4822988)
      ..lineTo(size.width * 0.06226905, size.height * 0.4822988)
      ..lineTo(size.width * 0.06226905, size.height * 0.4897610)
      ..close();

    final paint21Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_21, paint21Fill);

    final path_22 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5016056)
      ..lineTo(size.width * 0.07077762, size.height * 0.5016056)
      ..lineTo(size.width * 0.07077762, size.height * 0.5134502)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5134502)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5016056)
      ..close();

    final paint22Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_22, paint22Fill);

    final path_23 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5119124)
      ..lineTo(size.width * 0.009207595, size.height * 0.5119124)
      ..lineTo(size.width * 0.009207595, size.height * 0.5103705)
      ..lineTo(size.width * 0.01841060, size.height * 0.5103705)
      ..lineTo(size.width * 0.01841060, size.height * 0.5119124)
      ..close();

    final paint23Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_23, paint23Fill);

    final path_24 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5045657)
      ..lineTo(size.width * 0.05310643, size.height * 0.5045657)
      ..lineTo(size.width * 0.05310643, size.height * 0.5030279)
      ..lineTo(size.width * 0.06230952, size.height * 0.5030279)
      ..lineTo(size.width * 0.06230952, size.height * 0.5045657)
      ..close();

    final paint24Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_24, paint24Fill);

    final path_25 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5104900)
      ..lineTo(size.width * 0.009207595, size.height * 0.5104900)
      ..lineTo(size.width * 0.009207595, size.height * 0.5030279)
      ..lineTo(size.width * 0.05380548, size.height * 0.5030279)
      ..lineTo(size.width * 0.05380548, size.height * 0.5104900)
      ..close();

    final paint25Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_25, paint25Fill);

    final path_26 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5119124)
      ..lineTo(size.width * 0.01767114, size.height * 0.5119124)
      ..lineTo(size.width * 0.01767114, size.height * 0.5044502)
      ..lineTo(size.width * 0.06226905, size.height * 0.5044502)
      ..lineTo(size.width * 0.06226905, size.height * 0.5119124)
      ..close();

    final paint26Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_26, paint26Fill);

    final path_27 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5237570)
      ..lineTo(size.width * 0.07077762, size.height * 0.5237570)
      ..lineTo(size.width * 0.07077762, size.height * 0.5356016)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5356016)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5237570)
      ..close();

    final paint27Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_27, paint27Fill);

    final path_28 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5341793)
      ..lineTo(size.width * 0.009207595, size.height * 0.5341793)
      ..lineTo(size.width * 0.009207595, size.height * 0.5326414)
      ..lineTo(size.width * 0.01841060, size.height * 0.5326414)
      ..lineTo(size.width * 0.01841060, size.height * 0.5341793)
      ..close();

    final paint28Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_28, paint28Fill);

    final path_29 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5267171)
      ..lineTo(size.width * 0.05310643, size.height * 0.5267171)
      ..lineTo(size.width * 0.05310643, size.height * 0.5251793)
      ..lineTo(size.width * 0.06230952, size.height * 0.5251793)
      ..lineTo(size.width * 0.06230952, size.height * 0.5267171)
      ..close();

    final paint29Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_29, paint29Fill);

    final path_30 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5326414)
      ..lineTo(size.width * 0.009207595, size.height * 0.5326414)
      ..lineTo(size.width * 0.009207595, size.height * 0.5251793)
      ..lineTo(size.width * 0.05380548, size.height * 0.5251793)
      ..lineTo(size.width * 0.05380548, size.height * 0.5326414)
      ..close();

    final paint30Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_30, paint30Fill);

    final path_31 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5341793)
      ..lineTo(size.width * 0.01767114, size.height * 0.5341793)
      ..lineTo(size.width * 0.01767114, size.height * 0.5267171)
      ..lineTo(size.width * 0.06226905, size.height * 0.5267171)
      ..lineTo(size.width * 0.06226905, size.height * 0.5341793)
      ..close();

    final paint31Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_31, paint31Fill);

    final path_32 = Path()
      ..moveTo(size.width * -0.00001221043, size.height * 0.5460239)
      ..lineTo(size.width * 0.07077762, size.height * 0.5460239)
      ..lineTo(size.width * 0.07077762, size.height * 0.5578685)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5578685)
      ..lineTo(size.width * -0.00001221043, size.height * 0.5460239)
      ..close();

    final paint32Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_32, paint32Fill);

    final path_33 = Path()
      ..moveTo(size.width * 0.01841060, size.height * 0.5563307)
      ..lineTo(size.width * 0.009207595, size.height * 0.5563307)
      ..lineTo(size.width * 0.009207595, size.height * 0.5547928)
      ..lineTo(size.width * 0.01841060, size.height * 0.5547928)
      ..lineTo(size.width * 0.01841060, size.height * 0.5563307)
      ..close();

    final paint33Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_33, paint33Fill);

    final path_34 = Path()
      ..moveTo(size.width * 0.06230952, size.height * 0.5489841)
      ..lineTo(size.width * 0.05310643, size.height * 0.5489841)
      ..lineTo(size.width * 0.05310643, size.height * 0.5474462)
      ..lineTo(size.width * 0.06230952, size.height * 0.5474462)
      ..lineTo(size.width * 0.06230952, size.height * 0.5489841)
      ..close();

    final paint34Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_34, paint34Fill);

    final path_35 = Path()
      ..moveTo(size.width * 0.05380548, size.height * 0.5549084)
      ..lineTo(size.width * 0.009207595, size.height * 0.5549084)
      ..lineTo(size.width * 0.009207595, size.height * 0.5474462)
      ..lineTo(size.width * 0.05380548, size.height * 0.5474462)
      ..lineTo(size.width * 0.05380548, size.height * 0.5549084)
      ..close();

    final paint35Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.5);
    canvas.drawPath(path_35, paint35Fill);

    final path_36 = Path()
      ..moveTo(size.width * 0.06226905, size.height * 0.5563307)
      ..lineTo(size.width * 0.01767114, size.height * 0.5563307)
      ..lineTo(size.width * 0.01767114, size.height * 0.5488685)
      ..lineTo(size.width * 0.06226905, size.height * 0.5488685)
      ..lineTo(size.width * 0.06226905, size.height * 0.5563307)
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
