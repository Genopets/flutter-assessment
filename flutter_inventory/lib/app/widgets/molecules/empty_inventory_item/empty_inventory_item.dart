import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyInventoryView extends StatelessWidget {
  const EmptyInventoryView(
      {Key? key,
      required this.preset,
      required this.imagePath,
      this.title,
      required this.subTitle})
      : super(key: key);
  final ColorPresets preset;
  final String imagePath;
  final String? title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final primaryColor = theme.primaryColor(preset);
    final textColor = theme.textColor(preset);
    return Padding(
      padding: EdgeInsets.only(bottom: theme.sizes.scale3200),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: AppPadding(
              child: Padding(
                padding: EdgeInsets.only(left: theme.sizes.scale300),
                child: Opacity(
                  opacity: 0.1,
                  child: SvgPicture.asset(
                    Assets.images.illustrations.solarRadial,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: ContentPadding(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.sizes.scale600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        imagePath,
                        color: primaryColor,
                      ),
                    ),
                    Center(
                      child: HeadlineSmall(
                        subTitle,
                        style: TextStyle(color: textColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
