import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/lines/lines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class NoiseWidget extends StatelessWidget {
  const NoiseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          Assets.images.noiseStatic.path,
          repeat: ImageRepeat.repeatX,
        ),
      ),
    );
  }
}

class LayoutCurveWidget extends StatelessWidget {
  const LayoutCurveWidget(this.color, {Key? key}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      top: 10.5,
      child: Opacity(
        opacity: 0.2,
        child: IgnorePointer(
          child: LayoutBorderCurveLines(
            color: color,
          ),
        ),
      ),
    );
  }
}

/// Widget contains a list of eyes
List<Widget> bottomEyesWidget(Color color) {
  return [
    Positioned(
      left: 8,
      bottom: 8,
      child: IgnorePointer(
        child: SvgPicture.asset(
          Assets.images.bottomLeftEye,
          allowDrawingOutsideViewBox: true,
          color: color.withOpacity(1),
          height: 40,
        ),
      ),
    ),
    Positioned(
      right: 8,
      bottom: 8,
      child: IgnorePointer(
        child: SvgPicture.asset(
          Assets.images.bottomRightEye,
          allowDrawingOutsideViewBox: true,
          color: color.withOpacity(1),
          height: 40,
        ),
      ),
    ),
  ];
}

class GlobalBorderWidget extends StatelessWidget {
  const GlobalBorderWidget({
    Key? key,
    this.presets = ColorPresets.teal,
    this.gradient,
    this.useOpacity = true,
    this.hideStatus = true,
  }) : super(key: key);

  final ColorPresets presets;
  final LinearGradient? gradient;
  final bool useOpacity;
  final bool hideStatus;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final opacityColor = useOpacity
        ? theme.opacityColor(presets).withOpacity(0.1)
        : theme.primaryColor(presets);
    var _gradient = gradient;
    _gradient ??= theme.gradient(presets);

    return IgnorePointer(
      child: AppPadding(
        enableBottomPadding: true,
        enableTopPadding: true,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: opacityColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  theme.sizes.scale950,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
