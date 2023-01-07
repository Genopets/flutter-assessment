import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/typography.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

enum AttributeType {
  head,
  body,
  eyes,
  tail,
  wing,
  antennae,
  ears,
  emissionColor,
  primaryColor,
  secondaryColor,
  parallaxColor,
  tertiaryColor,
  mane,
  horn,
  tattooIndex,
  petStage,
  level,
  unknown
}

extension AttributeInfo on AttributeType {
  String get icon {
    switch (this) {
      case AttributeType.head:
        return Assets.icons.head;
      case AttributeType.body:
        return Assets.icons.body;
      case AttributeType.eyes:
        return Assets.icons.eyes;
      case AttributeType.tail:
        return Assets.icons.tail;
      case AttributeType.wing:
        return Assets.icons.wing;
      case AttributeType.antennae:
        return Assets.icons.antennae;
      case AttributeType.ears:
        return Assets.icons.ears;
      case AttributeType.mane:
        return Assets.icons.mane;
      case AttributeType.horn:
        return Assets.icons.horn;
      case AttributeType.petStage:
        return Assets.icons.reticle;
      case AttributeType.emissionColor:
        return Assets.icons.emissioncolor;
      case AttributeType.primaryColor:
        return Assets.icons.primarycolor;
      case AttributeType.secondaryColor:
        return Assets.icons.secondarycolor;
      case AttributeType.tertiaryColor:
        return Assets.icons.tertiarycolor;
      case AttributeType.parallaxColor:
        return Assets.icons.parallaxcolor;
      case AttributeType.tattooIndex:
        return Assets.icons.algorithm;
      case AttributeType.level:
        return Assets.icons.reticle;
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case AttributeType.petStage:
        return 'Pet stage';
      case AttributeType.emissionColor:
        return 'Emission color';
      case AttributeType.primaryColor:
        return 'Primary color';
      case AttributeType.parallaxColor:
        return 'Parallax color';
      case AttributeType.tertiaryColor:
        return 'Tertiary color';
      case AttributeType.secondaryColor:
        return 'Secondary color';
      case AttributeType.tattooIndex:
        return 'Tattoo index';
      default:
        return name;
    }
  }
}

class PetAttributeGridItem extends StatelessWidget {
  const PetAttributeGridItem({
    Key? key,
    this.type = AttributeType.head,
    required this.title,
    this.borderRadius,
  }) : super(key: key);

  final AttributeType type;
  final String title;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final _theme = GenopetsTheme.of(context);
    final color = _theme.colors.primary.yellow;
    final colorText = _theme.colors.text.yellow;
    final sizes = _theme.sizes;

    return SizedBox(
      height: 59,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color.withOpacity(.4), width: 0.5),
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(sizes.scale300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    type.icon,
                    height: 18,
                    color: color,
                  ),
                  SizedBox(width: sizes.scale300),
                  Expanded(
                    child: HeadlineSmall(
                      type.title,
                      softWrap: true,
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: SvgPicture.asset(
                      type.icon,
                      height: 18,
                      color: color,
                    ),
                  ),
                  Expanded(
                    child: Body1(
                      title,
                      softWrap: true,
                      style: TextStyle(
                        color: colorText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
