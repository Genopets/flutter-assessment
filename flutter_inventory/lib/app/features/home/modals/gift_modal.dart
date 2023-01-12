import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/stores/app_store.dart';
import 'package:flutter_inventory/app/stores/ui_store.dart';
import 'package:flutter_inventory/app/styles/colors.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';
import 'package:flutter_inventory/app/widgets/atoms/button/simple_icon_button.dart';
import 'package:flutter_inventory/app/widgets/atoms/button/simple_text_button.dart';
import 'package:flutter_inventory/app/widgets/atoms/misc.dart';
import 'package:flutter_inventory/app/widgets/atoms/typography/headlines.dart';
import 'package:flutter_inventory/gen/assets.gen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class GiftModal extends StatefulWidget {
  const GiftModal({super.key});

  static BorderRadiusGeometry borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  @override
  State<GiftModal> createState() => _GiftModalState();
}

class _GiftModalState extends State<GiftModal> {
  // int qty = 1;
  late ThemeDataT theme;
  bool isBeingPressed = false;

  @override
  void didChangeDependencies() {
    theme = GenopetsTheme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: theme.linearGradients.tealTopBottom,
                borderRadius: GiftModal.borderRadius),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: theme.linearGradients.bottom50,
                borderRadius: GiftModal.borderRadius),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: theme.overlay(ColorPresets.black),
                borderRadius: GiftModal.borderRadius),
          ),
          const NoiseWidget(),
          _createBody()
        ],
      ),
    );
  }

  Widget _createBody() {
    final _uiStore = Modular.get<UiStore>();
    final sizes = theme.sizes;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: sizes.scale800, horizontal: sizes.scale900),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          HeadlineSmall('Anima wants to send you some gifts',
              style: TextStyle(color: theme.colors.primary.yellow)),
          SizedBox(
            height: sizes.scale800,
          ),
          Assets.images.anima.image(height: sizes.scale4800),
          Expanded(
            child: SizedBox(
              height: sizes.scale800,
            ),
          ),
          Observer(builder: (context) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_uiStore.qty > 1)
                  SimpleIconButton(
                    size: sizes.scale1200,
                    icon: RotationTransition(
                      turns: const AlwaysStoppedAnimation(180 / 360),
                      child: SvgPicture.asset(Assets.icons.hexagonTriangle,
                          color: theme.colors.primary.yellow,
                          height: sizes.scale900),
                    ),
                    onTapDown: (TapDownDetails tapDownDetails) async =>
                        increaseQty(),
                    onTapUp: (TapUpDetails tapDownDetails) =>
                        isBeingPressed = false,
                    onTapCancel: () => isBeingPressed = false,
                  )
                else
                  SizedBox(width: sizes.scale1200),
                SizedBox(width: sizes.scale600),
                HeadlineSmall('${_uiStore.qty}',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: theme.colors.primary.teal,
                        height: .90,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400)),
                SizedBox(width: sizes.scale600),
                SimpleIconButton(
                  size: sizes.scale1200,
                  icon: SvgPicture.asset(Assets.icons.hexagonTriangle,
                      color: theme.colors.primary.yellow,
                      fit: BoxFit.fitHeight,
                      height: sizes.scale900),
                  onTapDown: (TapDownDetails tapDownDetails) async =>
                      increaseQty(type: 'increase'),
                  onTapUp: (TapUpDetails tapDownDetails) =>
                      isBeingPressed = false,
                  onTapCancel: () => isBeingPressed = false,
                )
              ],
            );
          }),
          Expanded(
            child: SizedBox(
              height: sizes.scale800,
            ),
          ),
          _createGiftButton(_uiStore)
        ],
      ),
    );
  }

  Widget _createGiftButton(UiStore _uiStore) {
    final _appStore = Modular.get<AppStore>();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: SimpleTextButton('Confirm gift',
          selected: true, icon: Assets.icons.genopetsLogoFilled, onTap: () {
        _appStore.getSomeGifts(_uiStore.qty);
        Navigator.pop(context);
      }),
    );
  }

  Future increaseQty({String type = 'decrease'}) async {
    final _uiStore = Modular.get<UiStore>();
    isBeingPressed = true;
    var sleepTime = 1000;
    var decreaseDelta = 250.0;

    while (isBeingPressed) {
      if (type == 'increase') {
        _uiStore.qty++;
      } else if (_uiStore.qty >= 1) {
        _uiStore.qty--;
      }
      await Future.delayed(Duration(milliseconds: sleepTime), () {
        if (sleepTime - decreaseDelta.toInt() >= 250) {
          sleepTime -= decreaseDelta.toInt();
          decreaseDelta *= 3;
        } else {
          sleepTime = 100;
        }
      });
    }
  }
}
