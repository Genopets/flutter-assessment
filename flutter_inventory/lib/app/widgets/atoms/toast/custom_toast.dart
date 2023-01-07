import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

enum ToastType { success, warning, error }

class CustomToastView extends StatefulWidget {
  const CustomToastView(
      {Key? key,
      required this.title,
      required this.message,
      this.color,
      this.toastType = ToastType.success,
      required this.duration,
      this.opacityLayer})
      : super(key: key);

  final String message;
  final String title;
  final Color? color;
  final ToastType toastType;
  final Duration duration;
  final bool? opacityLayer;

  @override
  State<CustomToastView> createState() => _CustomToastViewState();
}

class _CustomToastViewState extends State<CustomToastView> {
  double _progress = 1;
  final progressIntervals = 500;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    final period = widget.duration.inMilliseconds ~/ progressIntervals;
    _timer = Timer.periodic(
      Duration(milliseconds: period),
      (timer) {
        if (mounted) {
          setState(
            () {
              if (_progress == 0) {
                timer.cancel();
              } else {
                _progress -= 1 / progressIntervals;
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    var _color = widget.color;
    var _opacityColor = widget.color;
    var gradientColors = [
      HexColor('#00393F'),
      HexColor('#181A1C'),
    ];

    if (_color == null) {
      switch (widget.toastType) {
        case ToastType.success:
          _color = theme.colors.primary.teal;
          _opacityColor = theme.colors.opacities.teal;
          gradientColors = [
            HexColor('#00393F'),
            HexColor('#181A1C'),
          ];
          break;
        case ToastType.warning:
          _color = theme.colors.primary.yellow;
          _opacityColor = theme.colors.opacities.yellow;
          gradientColors = [
            HexColor('#2C2C06'),
            HexColor('#181A1C'),
          ];
          break;
        default:
          _color = theme.colors.primary.pink;
          _opacityColor = theme.colors.opacities.pink;
          gradientColors = [
            HexColor('#420031'),
            HexColor('#181A1C'),
          ];
          break;
      }
    }
    final _gradient = LinearGradient(
      colors: gradientColors,
      begin: const Alignment(-0.5, -8),
      end: const Alignment(0.5, 1),
    );
    final _borderRad = BorderRadius.only(
      topLeft: theme.radius.rounded,
      bottomRight: theme.radius.rounded,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AppPadding(
        child: ContentPadding(
          child: Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              gradient: _gradient,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color:
                        _opacityColor ?? theme.opacityColor(ColorPresets.teal)),
                borderRadius: _borderRad,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: theme.sizes.scale300,
                horizontal: theme.sizes.scale600,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.exclamationMark,
                        width: 22,
                        height: 22,
                        color: _color,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.5),
                        child: FittedBox(
                          child: Subheading(
                            widget.title,
                            resizable: true,
                            maxLines: 1,
                            isLowercase: false,
                            style: TextStyle(
                              color: _color,
                              height: 1.28,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            right: 16,
                          ),
                          child: SvgPicture.asset(
                            Assets.icons.alertCircuit,
                            color: _color,
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    child: Body1(
                      widget.message,
                      resizable: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: HSLColor.fromColor(_color)
                            .withLightness(.9)
                            .toColor(),
                        height: 1.56,
                        letterSpacing: 0,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(
                      top: theme.sizes.scale400,
                      right: theme.sizes.scale600,
                    ),
                    child: LinearProgressIndicator(
                      minHeight: 1.8,
                      valueColor: AlwaysStoppedAnimation<Color>(_color),
                      backgroundColor: _color.withOpacity(.2),
                      value: _progress,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomToast({
  required String message,
  required String title,
  ToastType toastType = ToastType.error,
}) {
  BotToast.showCustomNotification(
    useSafeArea: false,
    duration: const Duration(seconds: 5),
    toastBuilder: (c) => CustomToastView(
      message: message,
      duration: const Duration(seconds: 5),
      title: title,
      toastType: toastType,
    ),
  );
}
