import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/features/home/modals/gift_modal.dart';
import 'package:flutter_inventory/app/features/home/view/inventory_sub_tab.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/dimensions.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/app_offset.dart';
import 'package:flutter_inventory/app/widgets/atoms/button/simple_text_button.dart';
import 'package:flutter_inventory/app/widgets/atoms/misc.dart';
import 'package:flutter_inventory/app/widgets/atoms/tab/rectangular_button.dart';
import 'package:flutter_inventory/app/widgets/atoms/typewriter/scrambled_text.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/app/widgets/molecules/empty_inventory_item/empty_inventory_item.dart';
import 'package:flutter_inventory/domain/entities/inventory_entity.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';

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
              child: RectangularButton(
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
        child: RectangularButton(
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

  Widget _createGiftButton(Sizes sizes) {
    return Container(
      padding: EdgeInsets.only(bottom: sizes.scale900),
      margin: EdgeInsets.symmetric(horizontal: sizes.scale1000),
      child: SimpleTextButton("Someone's knocking...",
          icon: Assets.icons.genopetsLogoFilled, onTap: () {
        showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            builder: (context) => const GiftModal());
      }),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: _createGiftButton(sizes),
        )
      ],
    );
  }
}
