import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/icons/svg_icon.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';

/// CurrentBankRate
///
/// This molecular widget was generated and this so this documentation should be
/// update with something specific. Add some description and help the next developer
/// understand what this molecule does.
class CurrentBankRate extends StatelessWidget {
  const CurrentBankRate(
      {Key? key,
      required this.marginalEnergy,
      this.preset = ColorPresets.yellow})
      : super(key: key);

  final double marginalEnergy;
  final ColorPresets preset;

  Widget buildNumberDisplay(
      {required BuildContext context,
      required double number,
      required String text,
      int precision = 0}) {
    final theme = GenopetsTheme.of(context);
    final primaryColor = theme.primaryColor(preset);
    final textColor = theme.textColor(preset);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleXXL(
          number.toStringAsFixed(precision),
          style:
              const TextStyle(fontSize: 100, height: 1, fontFamily: 'Manuka'),
          textColor: primaryColor,
        ),
        HeadlineSmall(
          text,
          style: TextStyle(
            color: textColor,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final primaryColor = theme.primaryColor(preset);
    final textColor = theme.textColor(preset);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeadlineSmall(
          'Current',
          style: TextStyle(
            color: textColor,
          ),
        ),
        TitleLarge(
          'BANK RATE',
          textColor: primaryColor,
        ),
        Row(
          children: [
            buildNumberDisplay(context: context, number: 1, text: 'Step'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.sizes.scale100),
              child: SvgIcon(
                Assets.icons.doubleRightChevron,
                preset: preset,
                color: textColor,
              ),
            ),
            buildNumberDisplay(
                context: context,
                number: marginalEnergy,
                text: 'Energy',
                precision: 2)
          ],
        )
      ],
    );
  }
}
