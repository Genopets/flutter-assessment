import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/dimensions.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/container/animated_container_border.dart';
import 'package:flutter_inventory/app/widgets/atoms/labels/item_quantity.dart';
import 'package:flutter_inventory/app/widgets/atoms/misc.dart';
import 'package:flutter_inventory/app/widgets/atoms/progress_indicator/dotted_border_progress_ring.dart';
import 'package:flutter_inventory/app/widgets/atoms/tab/tab.dart';
import 'package:flutter_inventory/app/widgets/atoms/typewriter/scrambled_text.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/app/widgets/molecules/empty_inventory_item/empty_inventory_item.dart';
import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InventoryScreen extends StatefulWidget {
  InventoryScreen({super.key, required this.inventory}) {
    inventoryTypes = inventory
        .map((item) => item.inventoryItem.type)
        .toSet(); // get unique item types
  }

  final List<InventoryEntity> inventory;
  late final Set<String> inventoryTypes;

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ScrambledTextController titleSTController = ScrambledTextController();

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.inventoryTypes.length + 1, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      titleSTController.animate();
    });
  }

  @override
  void didUpdateWidget(InventoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the arguments have changed, update the TabController with the new length.
    if (oldWidget.inventoryTypes.length != widget.inventoryTypes.length) {
      _tabController =
          TabController(length: widget.inventoryTypes.length + 1, vsync: this);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _getInventoryViews() {
    // filter by type
    final views = widget.inventoryTypes.map((itemTypeToBuild) {
      final inventoryItems = widget.inventory
          .where((item) => item.inventoryItem.type == itemTypeToBuild)
          .toList();
      if (inventoryItems.isEmpty) {
        return _getEmptyWidget(itemTypeToBuild);
      }
      return InventorySubTab(
          key: Key(itemTypeToBuild), inventoryToDisplay: inventoryItems);
    }).toList();

    // ignore: cascade_invocations
    views.insert(
        0,
        widget.inventory.isEmpty
            ? _getEmptyWidget('ALL')
            : InventorySubTab(
                key: const Key('All'),
                inventoryToDisplay: widget.inventory,
              ));

    return views;
  }

  List<Widget> _getTabs(Sizes sizes) {
    final tabs = widget.inventoryTypes
        .toList()
        .asMap()
        .entries
        .map((entry) => Tab(
              child: TabBarItem(
                title: entry.value,
                selected: _tabController.index ==
                    entry.key + 1, // make space for the ALL tab
                textHeight: 1.1,
                icon: _getTabIcon(entry.value),
              ),
            ))
        .toList();

    // ignore: cascade_invocations
    tabs.insert(
      0,
      Tab(
        child: TabBarItem(
          title: 'all',
          // add the ALL tab
          selected: _tabController.index == 0,
          position: TabPosition.first,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(sizes.scale700),
          ),
          textHeight: 1.1,
        ),
      ),
    );

    return tabs;
  }

  String _getTabIcon(String tabName) {
    final tabNameUpper = tabName.toUpperCase();
    final icons = <String, String>{
      'BOOST': Assets.icons.energy,
      'FOOD': Assets.icons.bread,
      'TOY': Assets.icons.toy,
      'AUGMENT': Assets.icons.augements,
      'CRYSTALS': Assets.icons.crystal,
      'REAGENT': Assets.icons.reagentIcon
    };
    return icons[tabNameUpper] ?? Assets.icons.hexagonTriangle;
  }

  Widget _getEmptyWidget(String tabName) {
    return EmptyInventoryView(
      preset: ColorPresets.yellow,
      imagePath: Assets.images.allEmptyInventory.path,
      subTitle: 'No Inventory',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final sizes = theme.sizes;

    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration:
              BoxDecoration(gradient: theme.linearGradients.tealTopBottom),
        ),
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(gradient: theme.linearGradients.bottom50),
        ),
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: theme.overlay(ColorPresets.black),
          ),
        ),
        const NoiseWidget(),
        SafeArea(
          bottom: false,
          child: PageOffset(
            topHeight: 40,
            sides: 0,
            child: AppPadding(
              child: ContentPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineLarge(
                      'Inventory',
                      style: TextStyle(color: theme.colors.primary.yellow),
                    ),
                    SizedBox(
                      height: sizes.scale300,
                    ),
                    if (widget.inventory.isEmpty) ...{
                      Expanded(
                        child: _getEmptyWidget('ALL'),
                      )
                    } else ...{
                      TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          indicator: const BoxDecoration(),
                          onTap: (_) => setState(() {}),
                          enableFeedback: true,
                          labelPadding: EdgeInsets.only(right: sizes.scale100),
                          tabs: _getTabs(sizes)),
                      SizedBox(height: sizes.scale200),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: _getInventoryViews(),
                        ),
                      ),
                    }
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
            Center(
              child: SizedBox(
                  height: 13,
                  width: 13,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colors.primary.grey.withOpacity(0),
                      backgroundBlendMode: BlendMode.hardLight,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 60,
                          spreadRadius: 20,
                          color: itemDisplaySettings.primaryColor,
                        )
                      ],
                    ),
                  )),
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

class InventorySubTab extends StatelessWidget {
  const InventorySubTab({super.key, required this.inventoryToDisplay});

  final List<InventoryEntity> inventoryToDisplay;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.sizes.scale400),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: inventoryToDisplay
              .asMap()
              .entries
              .map((entry) => InventoryListItem(
                    index: entry.key,
                    length: inventoryToDisplay.length,
                    inventoryEntity: entry.value,
                  ))
              .toList()),
    );
  }
}
