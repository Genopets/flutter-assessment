import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_svg/svg.dart';

class TitleInfo extends StatelessWidget {
  const TitleInfo({
    Key? key,
    this.preset = ColorPresets.teal,
    required this.title,
    this.caption,
    this.action,
    this.useResizableText = false,
    this.enableScrambledText = false,
    this.icon,
    this.maxLine = 1,
  }) : super(key: key);

  final ColorPresets preset;
  final String title;
  final String? caption;
  final Widget? action;
  final bool useResizableText;
  final bool enableScrambledText;
  final SvgPicture? icon;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final color = theme.primaryColor(preset);

    return Row(
      children: [
        if (icon != null) ...[
          SizedBox(height: 24, width: 24, child: icon),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (caption != null)
                Padding(
                  padding: EdgeInsets.only(left: theme.sizes.scale100),
                  child: PlaceholderText(
                    caption!,
                    enableScrambledText: enableScrambledText,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ),
              TitleLarge(
                title,
                resizable: useResizableText,
                maxLines: maxLine,
                textColor: color,
                style: TextStyle(
                  color: color,
                ),
                enableScrambledText: enableScrambledText,
                enableShadowText: true,
                bgStyle: TextStyle(
                  color: color.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
        action ?? const SizedBox.shrink(),
      ],
    );
  }
}
