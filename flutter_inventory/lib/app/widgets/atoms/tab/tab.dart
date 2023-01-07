import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/typography.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

enum TabPosition { first, last, inBetween }

class TabBarItem extends StatelessWidget {
  const TabBarItem(
      {Key? key,
      required this.title,
      required this.selected,
      this.icon,
      this.textHeight,
      this.position = TabPosition.inBetween,
      this.borderRadius,
      this.onTap,
      this.hideIcon = false})
      : super(key: key);

  final String title;
  final String? icon;
  final bool selected;
  final double? textHeight;
  final TabPosition position;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final bool hideIcon;

  @override
  Widget build(BuildContext context) {
    final _theme = GenopetsTheme.of(context);
    final color =
        selected ? _theme.colors.primary.yellow : _theme.colors.primary.teal;
    final colorText =
        selected ? _theme.colors.text.yellow : _theme.colors.text.teal;
    final _gradient = LinearGradient(
      colors: [color.withOpacity(.3), Colors.transparent],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    );
    final sizes = _theme.sizes;

    return InkWell(
      onTap: onTap ?? onTap,
      child: Container(
        height: 48,
        decoration: ShapeDecoration(
          gradient: _gradient,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color.withOpacity(.4)),
            borderRadius: borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(
                    position == TabPosition.first ? sizes.scale700 : 0,
                  ),
                  bottomRight: Radius.circular(
                    position == TabPosition.last ? sizes.scale700 : 0,
                  ),
                ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(sizes.scale300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!hideIcon) ...{
                SvgPicture.asset(
                  icon ?? Assets.icons.hexagonTriangle,
                  color: colorText,
                ),
                SizedBox(width: sizes.scale300),
              },
              HeadlineSmall(
                title,
                style: TextStyle(
                  color: colorText,
                  height: textHeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
