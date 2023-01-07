import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class CustomRadioOption extends StatelessWidget {
  const CustomRadioOption({
    Key? key,
    this.onPressed,
    this.preset = ColorPresets.teal,
    this.selected = false,
    this.size = 30,
    this.disabled = false,
    this.backgroundGradient,
    this.color,
  }) : super(key: key);

  final GestureTapCallback? onPressed;
  final ColorPresets preset;
  final bool selected;
  final bool disabled;
  final double size;

  final LinearGradient? backgroundGradient;
  final Color? color;

  Widget _renderSelected(ThemeDataT theme, Color color) {
    return Container(
      decoration: ShapeDecoration(
        color: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(360),
          ),
        ),
      ),
      height: size / 1.6,
      width: size / 1.6,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    final _gradient = disabled
        ? theme.colors.background.grey
        : (backgroundGradient ?? theme.backgroundGradient(preset));
    final _color = disabled
        ? theme.colors.primary.grey
        : (color ?? theme.primaryColor(preset));

    return SizedBox(
      height: size,
      width: size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? () {} : onPressed,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(360)),
          ),
          child: Stack(
            children: [
              Container(
                decoration: ShapeDecoration(
                  gradient: _gradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(360),
                    ),
                    side: BorderSide(color: _color),
                  ),
                ),
                height: size,
                width: size,
              ),
              Center(
                child: selected
                    ? _renderSelected(theme, _color)
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
