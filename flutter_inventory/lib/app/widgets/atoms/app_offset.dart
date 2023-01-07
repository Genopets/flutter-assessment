import 'package:flutter/material.dart';
import 'package:flutter_inventory/app/styles/genopet_theme.dart';

class AppOffset extends StatelessWidget {
  const AppOffset({Key? key, required this.child, this.topHeight})
      : super(key: key);

  final Widget child;
  final double? topHeight;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: topHeight ?? theme.sizes.scale1400),
      child: child,
    );
  }
}

class PageOffset extends StatelessWidget {
  const PageOffset({
    Key? key,
    required this.child,
    this.topHeight,
    this.sides,
  }) : super(key: key);

  final Widget child;
  final double? topHeight;
  final double? sides;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);
    final top = theme.sizes.scale800;
    final left = sides ?? theme.sizes.scale800;
    final right = sides ?? theme.sizes.scale800;

    return Padding(
      padding: EdgeInsets.only(
        top: topHeight ?? top,
        left: left,
        right: right,
      ),
      child: child,
    );
  }
}

class ContentPadding extends StatelessWidget {
  const ContentPadding({
    Key? key,
    required this.child,
    this.enableTopPadding = false,
    this.enableBottomPadding = false,
  }) : super(key: key);

  final Widget child;
  final bool enableTopPadding;
  final bool enableBottomPadding;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: theme.sizes.scale300,
        right: theme.sizes.scale300,
        bottom: enableBottomPadding ? theme.sizes.scale300 : 0,
        top: enableTopPadding ? theme.sizes.scale300 : 0,
      ),
      child: child,
    );
  }
}

class AppPadding extends StatelessWidget {
  const AppPadding({
    Key? key,
    required this.child,
    this.enableTopPadding = false,
    this.enableBottomPadding = false,
    this.topPadding,
  }) : super(key: key);

  final Widget child;
  final bool enableTopPadding;
  final bool enableBottomPadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    final theme = GenopetsTheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: theme.sizes.scale400,
        right: theme.sizes.scale400,
        bottom: enableBottomPadding ? theme.sizes.scale400 : 0,
        top: enableTopPadding ? (topPadding ?? theme.sizes.scale400) : 0,
      ),
      child: child,
    );
  }
}
