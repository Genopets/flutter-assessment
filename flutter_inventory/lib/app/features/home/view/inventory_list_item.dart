import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/container/animated_container_border.dart';
import 'package:flutter_inventory/app/widgets/atoms/labels/item_quantity.dart';
import 'package:flutter_inventory/app/widgets/atoms/progress_indicator/dotted_border_progress_ring.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class InventoryListItem extends StatelessWidget {
  const InventoryListItem(
      {super.key,
      required this.index,
      required this.length,
      required this.inventoryEntity});

  final int index;
  final int length;
  final InventoryEntity inventoryEntity;

  BorderRadius _borderRadus() {
    if (index == 0) {
      return const BorderRadius.only(topLeft: Radius.circular(30));
    } else if (index == 1) {
      return const BorderRadius.only(topRight: Radius.circular(30));
    } else if (index == length - 1) {
      return const BorderRadius.only(bottomRight: Radius.circular(30));
    } else if (index == length - 2) {
      return const BorderRadius.only(bottomLeft: Radius.circular(30));
    }
    return BorderRadius.zero;
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final itemDisplaySettings = inventoryEntity.getDisplaySettings(theme);
    return AnimatedBorderContainer(
      opacity: 0.2,
      preset: itemDisplaySettings.preset,
      borderRadius: BorderRadius.zero,
      strokeWidth: 1,
      child: Container(
        padding: EdgeInsets.only(bottom: theme.sizes.scale300),
        decoration: BoxDecoration(gradient: itemDisplaySettings.gradient),
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.images.esoRadial2,
              fit: BoxFit.cover,
              height: double.infinity,
              color: itemDisplaySettings.primaryColor,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: CachedNetworkImage(
                    imageUrl: inventoryEntity.imageUrl,
                    fit: BoxFit.fitHeight,
                    placeholder: (context, url) =>
                        const DottedBorderProgressRing(),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) =>
                            Assets.images.item.image(
                      fit: BoxFit.fitHeight,
                    ),
                  )),
                )),
                HeadlineSmall(
                  inventoryEntity.inventoryItem.name,
                  style: TextStyle(
                    color: itemDisplaySettings.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                ItemQuantity(
                  quantity: '${inventoryEntity.quantity}',
                  color: itemDisplaySettings.textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
