import 'package:flutter/material.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';

class NoiseBackground extends StatelessWidget {
  const NoiseBackground({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child!,
        IgnorePointer(
          child: Image.asset(
            Assets.images.noiseBackground.path,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
