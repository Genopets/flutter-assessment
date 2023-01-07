import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: HexColor('#00FFC8'),
      end: HexColor('#FFC000'),
    ).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: _colorAnimation,
    );
  }
}
