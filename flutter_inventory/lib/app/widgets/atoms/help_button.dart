import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
    this.onPressed,
    this.preset = ColorPresets.teal,
  }) : super(key: key);

  final void Function()? onPressed;
  final ColorPresets preset;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final color = theme.primaryColor(preset);
    final _grad = theme.gradient(preset);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: _grad,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: color.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help_outline, color: color),
              SizedBox.fromSize(size: const Size.fromWidth(5)),
              HeadlineLarge(
                'Help',
                enableShadowText: true,
                style: TextStyle(color: color),
                bgStyle: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
